# InfoMapper / Development Environment / Folders #

The following folder structure is recommended for InfoMapper development. Top-level folders should
be created as necessary. The following folder structure clearly separates user files, development
area (`owf/dev/`), product (`app-infomapper-ng`), repositories for the product (`git-repos`), and
specific repositories for the product (`owf-app-infomapper-ng*`). 

```text
C:\Users\user\                               User's home folder for Windows.
/c/Users/user/                               User's home folder for Git Bash.
/cygdrive/C/Users/user/                      User's home folder for Cygwin.
/home/user/                                  User's home folder for Linux.
  owf-dev/                                   Work done on Open Water Foundation products.
    app-infomapper-ng/                       InfoMapper product.
      git-repos/                             Git repositories for the InfoMapper.
        owf-app-infomapper-ng/               Infomapper code repository.
        owf-app-infomapper-ng-doc-dev/       This Infomapper developer documentation repository.
        owf-app-infomapper-ng-doc-user/      Infomapper user documentation repository.
```

Separate repositories have been created for documentation and functional tests to
limit each repository's size and complexity and to facilitate contributions by different people.
The [owf-util-git](https://github.com/OpenWaterFoundation/owf-util-git) utilities are being developed
to facilitate use of Git and useful scripts are copied into `build-util/git-util` (see below).

The following summarizes the folder structure for this (`owf-app-infomapper-ng-doc-dv`) repository.
OWF uses [Visual Studio Code](https://code.visualstudio.com/) for development in the
TypeScript language and configures the repository to ignore certain files.
Other developers can use a different TypeScript development environment tool; however, OWF may not
have resources to troubleshoot. Folders and files in repositories will be automatically created
when the repository is cloned. For the full InfoMapper Folder Structure View, see the InfoMapper
main [README.md](https://github.com/OpenWaterFoundation/owf-app-infomapper-ng/blob/master/README.md).

```text
owf-app-infomapper-ng-doc-dev/     The InfoMapper code and documentation repository.
  .git/                            Standard Git folder for repository files (DO NOT TOUCH!).
  .gitattributes/                  Standard Git configuration file for repository (for portability).
  .gitignore/                      Standard Git configuration file to ignore dynamic working files.
  build-util/                      Scripts to help in the InfoMapper development environment.
  mkdocs-project/                  Main module folder for InfoMapper software.
    docs/                          Contains all folders for the project.
      css/                         Contains the styling for the project.
      dev-env/                     Holds all files relating to the development environment.
      dev-new/                     Instructions for new developers to set up a workflow.
      dev-tasks/                   Developer tasks to be done for the project.
      images/                      Images used in this documentation.
      introduction/                Formal introduction to the InfoMapper and its purpose.
      resources/                   Links to resources used in the InfoMapper.
      software-design/             Discusses the software design for the InfoMapper.
      troubleshooting/             Contains help for various common issues throughout development.
      ui-design/                   Describes the steps taken by OWF for a better user experience.
      index.md                     The starting point and first page displayed for these docs.
    mkdocs.yml                     The mkdocs configuration file with project settings.
    README.md                      Top-level README for the development documentation.
```
