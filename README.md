# owf-app-infomapper-ng-doc-dev #

This repository contains the [Open Water Foundation (OWF)](http://openwaterfoundation.org/) InfoMapper software developer documentation.
The documentation is written for software developers and some knowledge about technologies that are used is required. 
However, an attempt has been made to avoid overly technical language.
See the following resources:

* [InfoMapper GitHub repository](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng)
* Published latest [InfoMapper User Documentation](http://software.openwaterfoundation.org/infomapper/latest/doc-user/).
* Published latest [InfoMapper Developer Documentation](http://software.openwaterfoundation.org/infomapper/latest/doc-dev/).
* InfoMapper software download page - must currently clone the [InfoMapper repository](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng)

## InfoMapper Software ##

The OWF InfoMapper software is an Angular web application that displays maps, time series, and other information products.
InfoMapper is under development and is being tested internally at OWF on multiple projects.
InfoMapper is designed to provide the following functionality:

1. Provide a core application that displays configurable menus.
2. Menus are linked to configurable maps, content pages, external sites, and other content.
3. Maps support events to display other data, such as popups, content pages, links to external websites,
and time series visualizations.
4. Integrates with other OWF tools including GeoProcessor (to create map configurations and process spatial data files)
and TSTool (to create time series data files and visualization configurations).

The goal is to automate complex data visualizations and publish to the web using cloud services.

## Repository Contents ##

See the [InfoMapper repository README](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng)
for information about the InfoMapper development environment folder structure.

The repository contains the following:

```text
owf-app-infomapper-ng-doc-dev/   Repository folder.
  .github/                       Files specific to GitHub such as issue template.
  .gitattributes                 Typical Git configuration file for repository attributes.
  .gitignore                     Typical Git configuration file for ignored file list.
  README.md                      This file.
  build-util/                    Useful scripts to view, build, and deploy documentation.
  mkdocs-project/                Typical MkDocs project for this documentation.
    mkdocs.yml                   MkDocs configuration file for website.
    docs/                        Folder containing source Markdown and other files for website.
    site/                        Folder created by MkDocs containing the static website - ignored using .gitignore.
```

## Development Environment ##

The development environment for contributing to this project requires installation of Python, MkDocs, and Material MkDocs theme.
Python 3 is used for development.
See the [OWF / Learn MkDocs](http://learn.openwaterfoundation.org/owf-learn-mkdocs/)
documentation for information about installing these tools.

The development environment will change as the developers upgrade to newer versions of software tools.

## Getting Started ##

Developer documentation is usually maintained parallel to the software development files.
See the [InfoMapper README](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng) for instructions
about cloning the software and documentation repositories.
The `build-util/git-clone-all-prod.sh` script is provided to clone the documentation repositories.

## Editing and Viewing Content ##

If the development environment is properly configured, edit and view content as follows:

1. Run the `build-util/run-mkdocs-serve-8001.sh` script (Linux) or equivalent.
2. View content in a web browser using URL `http://localhost:8000`.
3. Edit content in the `mkdocs-project/docs` folder and update `mkdocs-project/mkdocs.yml` as appropriate.
	* Changes to files will cause the web browser page to refresh.
	If necessary, refresh the browser page manually.
	* The MkDocs software will print messages to the terminal about missing files
	and broken links.  Fix those issues before publishing the documentation.

## Style Guide ##

The following are general style guide recommendations for this documentation,
with the goal of keeping formatting simple in favor of focusing on useful content:

* Use the Material MkDocs theme - it looks nice, provides good navigation features, and enables search.
* Follow MkDocs Markdown standards - use extensions beyond basic Markdown when useful.
* Show files and program names as `code (tick-surrounded)` formatting.
* Where a source file can be linked to in GitHub, provide a link so that the most current file can be viewed.
* Use triple-tick formatting for code blocks, with language specifier.
* Use ***bold italics*** when referencing UI components such as menus.
* Use slashes with spaces to indicate ***Menu / SubMenu***.
* Place images in a folder named `images`.
* Minimize the use of inlined HTML, but use it where Markdown formatting is limited.
* Although the Material them provides site and page navigation sidebars,
provide in-line table of contents at the top of pages, where appropriate, to facilitate review of page content.

## License ##

Copyright by the Open Water Foundation (2017-2022).
The documentation is licensed under the
[Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).

The InfoMapper software is licensed using the GPL v3 (or later) license.
See the [InfoMapper software repository](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng) for more information.

## Contributing ##

Contribute to the documentation as follows:

1. Use GitHub repository issues to report minor issues.
2. Use GitHub pull requests.

## Maintainers ##

This repository is maintained by the [Open Water Foundation](http://openwaterfoundation.org/).

## Release Notes ##

Changes to developer documentation are tracked in issues for the
[GitHub repository](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng-doc-dev/issues).
