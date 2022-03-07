# InfoMapper / Development Tasks / Running & Usage #

The following sections describe how to run the InfoMapper in different environments,
and other ways to use singular elements of the InfoMapper, such as the Common library
as a whole or specific components of it.

## Running InfoMapper in a Dev Environment

Change directories from the top-level `owf-app-infomapper-ng` folder in the InfoMapper to
`infomapper`. From here, serve up a local server by using the command

```
ng serve --open
```

This will use localhost on default port `4200`. The `--open` option will automatically open the
app in a new tab on your default browser after set up is completed. If a second project wants
to be tested or run simultaneously, the command

```
ng serve --port <number> --open
```

can be used where `<number>` is an integer in between `1024 - 65,535` (and obviously not `4200`).

When changes to the code are saved, Angular will automatically refresh the server and display
the new rendered web page to help with development. 

## Embedding a Map Component in a website ##

The following two sections describe the necessary actions for a developer (1) to build
the AppDev application so that the Map Component is used as the app entry point,
and (2) for embedding the Map Component into a separate non-Angular created website.

### Creating the Map Web Component ###

The angulardev application can be compiled in a way so that a map can be embedded into a
website as a custom element; This uses something called
[Angular Elements](https://angular.io/guide/elements).

Navigate to the `angulardev` application's `app.module.ts` file in the
[AppDev](https://github.com/OpenWaterFoundation/owf-app-dev-ng) repository.
The code snippet below displays what the code from the `app.module.ts` must match when the
`create-common-package.sh -R` script is run. This is done so that only the MapComponent is
"seen" as the project, and a webComponent is created so the newly generated tag name can
be used by the consuming website.

Note that normally the `entryComponents` NgModule property and the creation of the
`webComponent` and subsequent `customElements` definition in the constructor 
is commented out. Also, the `bootstrap` NgModule property is usually uncommented out.
This is because when an Angular app is built, it ordinarily needs to know the
first component it needs to "bootstrap", or create. Since only the Map Component is
desired (from the Common library), and the AppComponent only exists in the angulardev
app, this is now commented out.

With the bootstrap property commented out, Angular needs to know what to do when the
`ng build` command is run. This is why the `entryComponents` property and the 2 lines
in the AppModule constructor are uncommented out for the custom element creation.

```typescript
  // Comment out when running ng serve for testing or ng build --configuration
  // production.
  // Uncomment out when running ./create-common-package.sh -R for building the
  // application so that only the MapComponent is seen.

  entryComponents: [
    MapComponent
  ],

  // Comment out when running ./create-common-package.sh -R for building the
  // application so that only the Map Component can be seen. It will try to
  // display the <app-root></app-root> element if it isn't. Uncomment out when
  // ng serve or ng build --configuration production is being used for testing
  // or building the project so that the application is used.
  
  // bootstrap: [
  //   AppComponent
  // ]
})
export class AppModule {
  constructor(private injector: Injector) {
    // Creates a custom HTML element with the name `common-map`. Displays the
    // Map Component in another application or website. Comment out when running
    // ng serve or ng build --configuration production. Uncomment out when
    // running ./create-common-package.sh -R for building the application so
    // that only the MapComponent is created, and the site can use <common-map>
    // as a tag in the HTML file.

    const webComponent = createCustomElement(MapComponent, {injector});
    customElements.define('common-map', webComponent);
  }
}
```

Once the section of code above matches the same section in the `app.module.ts` file, 
the command `./create-common-package.sh -R` script can be run in the build-util/ folder
from the `owf-app-dev-ng` repo. This will run `ng build` and concatenate the bundled
file names into the file `map-component.VERSION.ts`, where VERSION is the current
InfoMapper version number (e.g. 3.0.0).

Among other things, the `./create-common-package -R` command will manipulate the
`dist/` folder in a way where the contents can be copy-pasted into a folder to be used by
a website. Further instructions for implementing this is covered in the next section.

### Using the Map Component in a website ###

It is assumed that the necessary dist/ files have been created at this point.
Confirmation can be performed by checking for the `map-component.VERSION.js` file
inside the `dist/angulardev/` folder in the `owf-app-dev-ng` repository. If the
file hasn't been created yet, follow the instructions at
[Creating the Map Web Component](#creating-the-map-web-component).

#### Creating the correct `app-config.json` ####

Normally the `app-config.json` file would contain menus to create and label for
the website, but since a singular component is being used, the `mainMenu` property
and array can be removed from the file. The `standaloneMap` property can be used
instead, and is shown in the below `app-config.json` example contents:

```json
{
  "title" : "InfoMapper",
  "homePage": "/content-pages/home.md",
  "favicon": "/img/OWF-Logo-Favicon-32x32.ico",
  "dataUnitsPath": "/img/DATAUNIT",
  "standaloneMap": {
    "mapProject": "map-config.json"
  },
  "X_googleAnalyticsTrackingId": "UA-123456789-1",
  "version": "1.0.0 (2020-12-01)"
}
```

The `mapProject` property needs the path to the singular map configuration file.
For more information on creating a map configuration file, visit the
[GeoMapProject Documentation](https://software.openwaterfoundation.org/geoprocessor/latest/doc-user/appendix-geomapproject/geomapproject/#introduction).

#### Embedded Map Component example ####

The following describes the file/folder structure for the very simple standalone
Map Component example:

```text
test-angular-folder/
  angulardev/                     Arbitrarily named folder that holds all created files from
                                  the angulardev/dist/ folder.
  assets/                         The assets/ folder from the angulardev/dist/ folder. Note
                                  this has been separated from the files that reside in
                                  angulardev/. The assets/ folder must live in the same
                                  directory as the index.html, since the assets/app top
                                  level path is still used by the Map Component. The remaining
                                  dist/ files could also be put in this test-angular-folder/
                                  level, but it was moved for readability purposes.
  index.html                      The simple index.html that makes use of script tags to
                                  embed a Map Component.
  run-server-8000.sh              Script to run a simple testing web server on port 8000
                                  using Python.
```

#### The example index.html file ####

Given the above organization of the component production files and folders, the
example `index.html` file contents can look like the following:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="./angulardev/map-component.3.0.0.js"></script>
    <link rel="stylesheet" href="./angulardev/styles.3.0.0.css">
 </head>
  <body>

    <div style="height: 900px; width:1200px;">
      <common-map app-config="assets/app/app-config.json"></common-map>
    </div>

  </body>
</html>
```

A few things to note about the above contents:

* Since the `./create-common-package.sh -R` command concatenated all production
JavaScript files into one, only that `.js` file is needed in the first (and only)
script tag. This cleans up the amount of scripts to be used.
* The `<common-map>` tag's surrounding div tag is crucial to displaying on the page.
In a regular Angular application, the component inherits its height and width from
its parent, grandparent, etc. When creating the Component be itself, it needs some
parent element to set its size. This will need to be explicitly provided.
* In the angulardev application's `AppModule` constructor, the customElement was
created with the name `common-map`, which is why it's used here to create the component.
This can be changed to any other HTML tag name using the correct convention if desired.
* The common-map tag's `app-config` attribute just needs the path to the `app-config.json`
file to perform the actions necessary to display.

#### Running the simple example ####

In this simple example, the `./run-server-8000.sh` command will spin up the server
on port 8000, and can be viewed by opening up a browser of choice and navigating
to `localhost:8000`.

>**NOTE:** The InfoMapper, Common library, and its components do not support
Internet Explorer. All newly created OWF projects will use the most up-to-date
practices that the newer browsers use, such as Google Chrome, Mozilla Firefox,
Microsoft Edge, etc.

