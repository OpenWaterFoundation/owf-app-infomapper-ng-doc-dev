# InfoMapper / Testing #

Open Water Foundation (OWF) is committed to utilizing automated tests on its applications,
with the possibility to expand to Continuous Integration in the future. This way apps
can be released with confidence that they have been thoroughly tested for bugs and
any other undesired behavior before user consumption. It can also be used to find
any new bugs after code is added that might have otherwise been missed.

## Cypress Testing  ##

OWF has chosen [Cypress](https://www.cypress.io/), the all-in-one testing framework &
assertion library, for easily testing the InfoMapper while actively developing.
It utilizes Mocha, Chai, jQuery, and other libraries to make testing as easy as possible.
More information for how to use Cypress can be found in their
[Guides documentation](https://docs.cypress.io/guides/overview/why-cypress).

## Setting up Cypress for testing ##

The following steps describe broad steps on how to install, set up, and use Cypress
to test an application. More in-depth information can be found at
[Installing Cypress](https://docs.cypress.io/guides/getting-started/installing-cypress).

* **Node.js** version 12 or 14 and above. 
* No **npm** version is listed, but if the above versioned Node.js is installed, it
will also install npm. The version installed should be sufficient. If any issues
occur, try updating to the most recent npm update by following the instructions
at the [npm docs](https://docs.npmjs.com/try-the-latest-stable-version-of-npm).

#### Installing Cypress with npm ####

```Shell
cd /your/project/path
```
```Shell
npm install cypress --save-dev
```

#### Opening Cypress ####

There are 3 ways to open Cypress, all from the top-level project folder:

The long way with the full path:

```Shell
./node_modules/.bin/cypress open
```

The shortcut using npm bin:

```Shell
$(npm bin)/cypress open
```

Adding an npm script (taken directly from the Cypress docs; the InfoMapper takes
advantage of this):

While there's nothing wrong with writing out the full path to the Cypress executable
each time, it's much easier and clearer to add Cypress commands to the `scripts`
field in your `package.json` file.

```json
{
  "scripts": {
    "cypress:open": "cypress open"
  }
}
```

Now you can invoke the command from your project root like so:

```Shell
npm run cypress:open
```

## How to test the InfoMapper ##

The InfoMapper followed the instructions from the Cypress Getting Started documentation,
and the
[Opening Cypress documentation](https://docs.cypress.io/guides/getting-started/installing-cypress#Opening-Cypress)
to be able to easily run Cypress using custom commands from the command line. Information
on how to set that up can be found above at
[Setting up Cypress for testing](#setting-up-cypress-for-testing). Once added, run
the command `npm run cypress:open` from the project's top-level directory. The Cypress
Test Runner will open and show all test suites and test files.

![Cypress Test Runner](/images/cypress-test-runner.png)

All test files can be run by clicking the `Run N integration specs` button in the
upper right. A single test can be run by clicking on it. The left hand side of the
page will display each passing test in green, and failing test in red. Note that a
'passing' test might include tests that are expected to fail. 

## Cypress Tips & Examples ##

### Tips ###

#### IDE Integration ####

Turn on IDE intellisense by adding `/// <reference types=”Cypress” />` at the
top of each spec test file. This confirms to work with VSCode, but other IDEs
will need to be checked. Cypress has more suggestions in their
[Tooling documentation](https://docs.cypress.io/guides/tooling/IDE-integration#Set-up-in-your-Dev-Environment).

#### The .hover() Method ####

There is no formal .hover() method in Cypress. Although it is the #10 (and oldest)
issue on the Cypress Github, the method has never been put in for some reason or
another. Because of this, workarounds have been used. These include (but are not
limited to) the following:

* `.invoke('show')` - jQuery method, confirmed to work.
* `.invoke('hide')` - jQuery method, confirmed to work.
* `.trigger('mouseover')` - Suggested, confirmed to work.
* `.trigger('mouseenter')` - Suggested, did not work, but could be developer error.

#### Dynamic data-cy attribute naming ####

Cypress recommends using the `data-*` attribute naming method for interacting with
elements on the DOM, as its a MDN Web Doc known practice, and will guarantee interaction
without worrying about changing of newer code later. Cypress has arbitrarily chosen `cy`
to be appended to represent Cypress. Therefore, adding a `data-cy` attribute as
an attribute to an HTML is used. More information can be found at the
[Selecting Elements documentation](https://docs.cypress.io/guides/references/best-practices#Selecting-Elements).

Sometimes, the name given to the `data-cy` attribute needs to be dynamic, and not
static like it is by default. In cases like this, dynamically create the name in
Angular by using the following:

```html
<button attr.data-cy="{{geoLayer.geoLayerId}}-kebab-clear-selection">
  Click Me!
</button>
```

#### Click on the screen ####

To click somewhere on the screen, for closing kebab menus or certain dialogs that allow
it, use:

```typescript
cy.get('body').click(0, 0)
```

This will click in the middle of the browser screen. The two arguments of click
represent the X & Y coordinates by pixel, and can be changed accordingly if the
click needs to happen in a different spot.

### Examples ###

#### Connecting to the server ####

If actively working on one or more Angular projects at the same time, each one will
need to be started on a different port. The following example performs a basic connection
to a server while using a variable so the port number can easily be seen and changed
if need be.

```javascript
var port = '30001';

it('InfoMapper Home', () => {
  cy.visit('http://localhost:' + port)
})
```
