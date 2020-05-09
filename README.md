# owf-app-info-mapper-ng-doc-dev #

This repository contains the [Open Water Foundation (OWF)](http://openwaterfoundation.org/) InfoMapper software developer documentation.
The documentation is written for software developers and some knowledge about technologies that are used is required. 
However, an attempt has been made to avoid overly technical language.
See the following resources:

* Published [InfoMapper User Documentation](http://software.openwaterfoundation.org/infomapper/latest/doc-user/).
* Published [InfoMapper Developer Documentation](http://software.openwaterfoundation.org/infomapper/latest/doc-dev/).
* [InfoMapper download page](http://software.openwaterfoundation.org/infomapper/).

## InfoMapper Software ##

The OWF InfoMapper software is an Angular web application that displays maps, time series, and other information products.
The OWF InfoMapper is under development and is being tested internally at OWF on multiple projects.
The OWF InfoMapper is designed to provide the following functionality:

1. Provide a core application that displays configurable menus.
2. Menus are linked to configurable maps, content pages, external sites, and other content.
3. Maps support events to display other data, such as popups, content pages, links to external websites,
and time series visualizations.
4. Integrates with other OWF tools including GeoProcessor and TSTool.

The goal is to allow automation of complex data visualizations and publish to the web using
cloud services.

## Repository Contents ##

The repository contains the following:

```text
owf-app-info-mapper-ng-doc-dev/   Repository folder.
  .github/                        Files specific to GitHub such as issue template.
  .gitattributes                  Typical Git configuration file for repository attributes.
  .gitignore                      Typical Git configuration file for ignored file list.
  README.md                       This file.
  build-util/                     Useful scripts to view, build, and deploy documentation.
  mkdocs-project/                 Typical MkDocs project for this documentation.
    mkdocs.yml                    MkDocs configuration file for website.
    docs/                         Folder containing source Markdown and other files for website.
    site/                         Folder created by MkDocs containing the static website - ignored using .gitignore.
```

## Development Environment ##

The development environment for contributing to this project requires installation of Python, MkDocs, and Material MkDocs theme.
Python 3 is used for development.
See the [OWF / Learn MkDocs](http://learn.openwaterfoundation.org/owf-learn-mkdocs/)
documentation for information about installing these tools.

The development environment will change as the developers upgrade to newer versions of software tools.

## Editing and Viewing Content ##

If the development environment is properly configured, edit and view content as follows:

1. Edit content in the `mkdocs-project/docs` folder and update `mkdocs-project/mkdocs.yml` as appropriate.
2. Run the `build-util/run-mkdocs-serve-8000.sh` script (Linux) or equivalent.
3. View content in a web browser using URL `http://localhost:8000`.

## Style Guide ##

The following are general style guide recommendations for this documentation,
with the goal of keeping formatting simple in favor of focusing on useful content:

* Use the Material MkDocs theme - it looks nice, provides good navigation features, and enables search.
* Follow MkDocs Markdown standards - use extensions beyond basic Markdown when useful.
* Show files and program names as `code (tick-surrounded)` formatting.
* Where a source file can be linked to in GitHub, provide a link so that the most current file can be viewed.
* Use triple-tick formatting for code blocks, with language specifier.
* Use ***bold italics*** when referencing UI components such as menus.
* Use slashes to indicate ***Menu / SubMenu***.
* Place images in a folder named `images`.
* Minimize the use of inlined HTML, but use it where Markdown formatting is limited.
* Although the Material them provides site and page navigation sidebars,
provide in-line table of contents on pages, where appropriate, to facilitate review of page content.

## License ##

Copyright by the Open Water Foundation (2017-2020).
The documentation is licensed under the
[Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).

The InfoMapper software is licensed using the GPL v3 (or later) license.
See the [InfoMapper software repository](https://github.com/OpenWaterFoundation/owf-app-info-mapper-ng) for more information.

## Contributing ##

Contribute to the documentation as follows:

1. Use GitHub repository issues to report minor issues.
2. Use GitHub pull requests.

## Maintainers ##

This repository is maintained by the [Open Water Foundation](http://openwaterfoundation.org/).

## Release Notes ##

Changes to developer documentation are tracked in issues for the
[GitHub repository](https://github.com/OpenWaterFoundation/owf-app-info-mapper-ng-doc-dev/issues).
