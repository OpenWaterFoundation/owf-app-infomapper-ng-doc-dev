# InfoMapper / New Developer #

* [Introduction](#introduction)
* [Install Development Software](#install-development-software)
* [Clone InfoMapper Repositories](#clone-infomapper-repositories)

-----------

## Introduction 

Need to fill this documentation out similar to GeoProcessor, but focusing on Angular environment.

Until this documentation is filled in, see the
[owf-app-infomapper-ng repository README](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng).

The InfoMapper is an Angular "single page" web application,
which requires installing software necessary to support Angular development.
The InfoMapper software has been developed on Windows using Cygwin and Git Bash.

## Install Development Software

Need to insert instructions to install necessary software.
Can provide a numbered list and link to pages in `dev-env/`.

## Clone InfoMapper Repositories 

The following steps are recommended to initialize local files from the GitHub repositories.

1. Create the folder for development:
	* On Windows: `C:\Users\user\owf-dev\InfoMapper\git-repos\`
	* On Cygwin: `/cygdrive/C/Users/user/owf-dev/InfoMapper/git-repos/`
	* On Git Bash: `//C/Users/user/owf-dev/InfoMapper/git-repos/`
2. Clone the main product repository:  `git clone https://github.com/OpenWaterFoundation/owf-app-infomapper-ng.git`
3. Change folders to `owf-app-infomapper-ng/build-util` and clone additional repositories
including user and developer documentation:  `./git-clone-all-prod.sh`
