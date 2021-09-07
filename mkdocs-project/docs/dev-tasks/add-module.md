# InfoMapper / Development Tasks / Adding a New Module #

Need to describe how to add a new module in Angular, conventions for the InfoMapper.

## Adding a Component from an Angular Library ##

The following are broad steps for implementing an Angular component from an Angular
library. It will be using the Common library as an example. They assume user knowledge
of library creation and building. For more information on creating Angular libraries,
check out the [Angular docs](https://angular.io/guide/creating-libraries). For information
on building, packing, and publishing the Common library, visit the
[Common Package](https://github.com/OpenWaterFoundation/owf-app-dev-ng/packages/655009)
page.

* Build and/or publish the library whose component will be used. Building the library
using `npm build --prod=true` and `npm pack` creates the necessary files in the
`dist/` folder, and packs them into a gzipped tarball; These files can be used for
testing. Publishing - using npm for example - is used for production use of the library.
* If the library was built and packed, import it into the Angular application's
`package.json` by adding something similar to the dependencies object:
```json
"@OpenWaterFoundation/common": "file:relative/path/to/the/file.tgz"
```
* If the library was published with npm, import using the line below with the
desired version number:

```json
"@OpenWaterFoundation/common": "0.3.0"
```

There are 2 different ways to display a component from a library in a consuming
application: Using the consuming application routing module, and using the component's
HTML selector name in a template file. To display using the router module:

* Import the component into the routing module using the line below. Use the component
reference in the route object to display the component when the path is updated.
```typescript
import { MapComponent } from '@OpenWaterFoundation/common/leaflet';
```

To display by using the component's selector name:

* Import the component into the application `app.module.ts` file and add to the
imports array. Use the component as if it were a part of the application.

For more instructions, visit the in depth dev
[Angular Web Components](https://indepth.dev/posts/1116/angular-web-components-a-complete-guide#how-this-works-)
article.