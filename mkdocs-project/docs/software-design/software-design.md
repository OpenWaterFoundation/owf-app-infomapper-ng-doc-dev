# InfoMapper / Software Design #

Need to fill in this documentation similar to GeoProcessor, with sections for major topics.

* [InfoMapper Design Background](#infomapper-design-background) - general background
* [Application](#application) - application class
* [InfoMapper Components](#infomapper-components)
    * [App Component](#app-component)
    * [Nav Bar Component](#nav-bar-component)
        * [Tab Component](#tab-component)
    * [Content Page Component](#content-page-component)
    * [Map Components](#map-components)
        * [Background Layer Component](#background-layer-component)
        * [Dialog Component](#dialog-component)
        * [Map Error Component](#map-error-component)
        * [StateMod Classes Component](#statemod-classes-component)

----------------------

## InfoMapper Design Background ##

Need to discuss Angular approach and overall design concepts.

## Application ##

Need to discuss the application... entry point, etc.

----

## InfoMapper Components ##

The following are the Angular components used by the InfoMapper:

### App Component ###

The first component to be made, and is in charge of the *application shell* - that is, what's
displayed on the web page. It shows the `<app-nav-bar>` in its template (.html) file, which
will show the menus. It also takes care of any 404 routing and updates Google Analytics when
a user clicks from one map or content page to another.

----

### Nav Bar Component ###

The Nav Bar Component reads in the app configuration file to start the process of assigning
globally used variables, and oversees the creation of each menu button.

#### Tab Component ####

Each Menu and sub-menu in the InfoMapper is a component itself, and its only purpose is to display
itself as clickable or not, visible or not, and whether to display a map, content page, or external
site when clicked depending on what the app configuration file contains.

----

### Content Page Component ###

The Content Page Component displays a scrollable Showdown created markdown file converted to HTML.
These can be about the website or a home page.

### Map Components ###

The Map Component is the main component to display the Leaflet map in the InfoMapper. It is created,
updated, styled, and destroyed when navigated away from. It uses the below components in helping
with this. The map's side bar information and legend is also created here with text and shapes defined
by the map configuration file.

#### Background Layer Component ####

Each background layer is its own component when created and displayed in the maps sidebar, initially
created by the map component above. Each one will show each background layer's name, description,
and radio button in the sidebar.

#### Dialog Content ####

When a feature on a Leaflet map is clicked, a popup will show up with that feature's information.
Buttons can be configured in the InfoMapper by the developer for extra information in the form of
a graph or more specific written text. When the button is clicked, what's called a Dialog will open,
and can be treated as another window in the InfoMapper. This component takes care of displaying,
sizing, styling, and other changes to the Dialog.

#### Map Error Component ####

Directs and routes the Angular application to a 404 page if an app or map configuration file is incorrect,
a link is broken, or others routing issues are run across by the InfoMapper

#### StateMod Classes Component ####

A standalone folder containing all classes converted from Java to TypeScript that parses and creates
TimeSeries (TS) objects from the reading of DateValue (.dv) and StateMod (.stm) files. StateMod files
were originally created by the State of Colorado, and DateValue file are a OWF created file that has
more metadata than a CSV file.
