# InfoMapper / Development Tasks / Running & Usage #

The following sections describe 

* [Running InfoMapper in a Dev Environment](#running-infomapper-in-a-dev-environment)
* []()
* [Embedding a Map Component in a website](#embedding-a-map-component-in-a-website)
    * [Creating the Map Web Component](#creating-the-map-web-component)

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
the `./create-common-package.sh -R` script can be run in the build-util/ folder from the
`owf-app-dev-ng` repo. This will run `ng build` and concatenate the bundled file names
into the file `map-component.VERSION.ts`, where VERSION is the current
InfoMapper version number (e.g. 3.0.0).


### Using the Map Component in a website ###