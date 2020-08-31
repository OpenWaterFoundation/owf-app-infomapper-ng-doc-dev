# InfoMapper / New Developer #

* [Introduction](#introduction)
* [Install Development Software](#install-development-software)
* [Clone InfoMapper Repositories](#clone-infomapper-repositories)
* [Install npm Packages](#install-npm-packages)
* [Run InfoMapper](#run-infomapper)

-----------

## Introduction 

Need to fill this documentation out similar to GeoProcessor, but focusing on Angular environment.

Until this documentation is filled in, see the
[owf-app-infomapper-ng repository README](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng).

The InfoMapper is an Angular "single page" web application,
which requires installing software necessary to support Angular development.
The InfoMapper software has been developed on Windows using Cygwin and Git Bash.

## Install Development Software

The software needed for development can be installed in the following order:

1. Install Cygwin for a Linux-like terminal for development. Instructions can be found under
Development Environment / [Cygwin](../../dev-env/cygwin).

2. Install Git for version control at Development Environment / [Git](../../dev-env/git).

3. Install Node and npm for running the application on a local machine. Instructions can
be found under Development Environment / [Node](../../dev-env/node).

4. Install the Angular framework for development of the InfoMapper at Development Environment /
[Angular](../../dev-env/angular).

5. Install QGIS. This is not required for development, but recommended for testing different layers or
researching handling of spatial data. More information can be found at Development Environment /
[QGIS](../../dev-env/qgis).

6. Install Visual Studio Code for editing and file organization. Instructions can be found at
Development Environment / [Visual Studio Code](../../dev-env/vs-code).

7. Install MkDocs. This is used for the editing of docs such as this InfoMapper documentation.
Directions for installing can be found under Development Environment / [MkDocs](../../dev-env/mkdocs).

## Clone InfoMapper Repositories 

The following steps are recommended to initialize local files from the GitHub repositories.

1. Create the folder for development:
	* On Windows: `C:\Users\user\owf-dev\InfoMapper\git-repos\`
	* On Cygwin: `/cygdrive/C/Users/user/owf-dev/InfoMapper/git-repos/`
	* On Git Bash: `//C/Users/user/owf-dev/InfoMapper/git-repos/`
2. Clone the main product repository:

		git clone https://github.com/OpenWaterFoundation/owf-app-infomapper-ng.git

3. Change folders to `owf-app-infomapper-ng/build-util` and clone additional repositories
including user and developer documentation:

		./git-clone-all-prod.sh

## Install npm Packages

Download, install and confirm the necessary packages for the InfoMapper by following the instructions
at Development Environment / [Node](../../dev-env/node/#installing-infomapper-npm-packages).

## Run InfoMapper

Now that everything has been set up, run the InfoMapper by following the directions in Development
Tasks / [Running](../../dev-tasks/running)
