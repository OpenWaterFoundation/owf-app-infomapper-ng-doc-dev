# InfoMapper / Software Design #

Need to fill in this documentation similar to GeoProcessor, with sections for major
topics.

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
* [Location Strategy](#location-strategy)

----------------------

## InfoMapper Design Background ##

Need to discuss Angular approach and overall design concepts.

## Application ##

Need to discuss the application... entry point, etc.

----

## InfoMapper Components ##

The following are the Angular components used by the InfoMapper:

### App Component ###

The first component to be made, and is in charge of the *application shell* - that
is, what's displayed on the web page. It shows the `<app-nav-bar>` in its template
(.html) file, which will show the menus. It also takes care of any 404 routing and
updates Google Analytics when a user clicks from one map or content page to another.

----

### Nav Bar Component ###

The Nav Bar Component reads in the app configuration file to start the process of
assigning globally used variables, and oversees the creation of each menu button.

#### Tab Component ####

Each Menu and sub-menu in the InfoMapper is a component itself, and its only purpose
is to display itself as clickable or not, visible or not, and whether to display
a map, content page, or external site when clicked depending on what the app configuration
file contains.

----

### Content Page Component ###

The Content Page Component displays a scrollable Showdown created markdown file converted
to HTML. These can be about the website or a home page.

----

## Location Strategy ##

Angular offers two methods of displaying its application's paths in the URL,
named location strategy. These are `PathLocationStrategy` and `HashLocationStrategy`.
The InfoMapper previously utilized the HashLocationStrategy. This added a `#` into
the URL at the beginning of the application's URL route. The full deployed URL would
look something like:

`https://poudre.openwaterfoundation.org/#/latest/content-page/home`

This strategy was originally used to alleviate a more in-depth solution required
with server-side routing (discussed below), and made deployment of the InfoMapper
simpler. There are a few features that are negatively effected by this however,
and the following are a few of them:

* Search Engine Optimization (SEO) takes a hit.
* Google Analytics cannot be as granular with its reporting.
* Markdown files have trouble with internal links, as the hash is used for that
process, making the URL contain two hashes.

### Current Location Strategy ###

OWF made the decision to use the PathLocationStrategy to resolve the issue the
HashLocationStrategy introduced. Now URLs will look like most other URLs:

`https://poudre.openwaterfoundation.org/latest/content-page/home`

This change brought back the server side routing issues however, and a solution
was required to fix it. This is gone into more detail in the
[Dealing with server side routing](../deployment/deployment.md#dealing-with-server-side-routing)
section under Deployment.