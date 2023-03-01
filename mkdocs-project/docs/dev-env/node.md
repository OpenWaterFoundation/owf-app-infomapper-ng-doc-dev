# InfoMapper / Development Environment / Node.js #

* [Node](#node.js)
    * [Installation](#installation)
* [Node Package Manager](#node-package-manager)
    * [Installing InfoMapper npm Packages](#installing-infomapper-npm-packages)
    * [Locally Installed Packages](#locally-installed-packages)
    * [NPM Audit Fix](#npm-audit-fix)
    * [The package-lock JSON file](#the-package-lock-json-file)

## Node.js ##

Node.js is a run-time environment that includes everything needed to execute a program
written in JavaScript. It is required for Angular to be installed, and for the ability
to run the InfoMapper in a developing environment. The InfoMapper uses TypeScript
as its coding language, a superset of JavaScript. TypeScript code will be transpiled
to JavaScript before it is run, so all valid JavaScript is TypeScript. TypeScript
is used instead of JavaScript for InfoMapper development for a number of reasons,
with the most useful being that TypeScript offers:

* Static Typing
* Classes
* Interfaces
* A more concrete way to utilize Object-Oriented Programming

Node.js will take the transpiled TypeScript and allow the InfoMapper to be run locally.

### Installation ###

>**NOTE:** According to npm documentation for
[installing Node.js and npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm), 
it is strongly recommended to use a Node version manager such as `nvm` instead of
a Node installer (shown below this notice). It is not required, as development on
the InfoMapper has been successful using an environment that has been created by
using both `nvm` and a Node installer. See the [Node Version Manager](#node-version-manager)
section below for more information on `nvm` installation and usage.

Download the latest stable release at
<a href="https://nodejs.org/en/download/" target="_blank">https://nodejs.org/en/download/</a>.
Confirm the installation was successful by running the command:

```bash
node -v
```

----

## Node Package Manager ##

The Node Package Manager (npm) is a manager for JavaScript packages. Angular and
the InfoMapper both use packages from the npm registry that are crucial for the project.

npm is installed with Node, but according to
[npm installation documentation](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm),
installing a global version of npm is recommended. This removes the chances of permissions
errors when running npm packages globally. Install npm globally by running:

```bash
npm install -g npm
```

Confirm successful installation with the command:

```bash
npm -v
```

Whereas Node only has one globally installed version of itself (unless using the
aforementioned Node Version Manager, which determines which global version to use),
npm has both a globally and locally installed version. This is because users could
potentially have many projects using npm on one machine, and it would be better to
support different packages with distinct versions for each.

The following sections are for after the InfoMapper has been cloned from Github,
and can be referenced later.

----

### Installing InfoMapper npm Packages ###

There are two ways to install npm packages: globally and locally. Installing packages
globally are beyond the scope of this documentation, as the InfoMapper will only use
locally installed packages. When npm packages are installed, each one is put into the
`node_modules` folder. This folder is ignored by Git (or other version control systems)
since it can be large in size.

When cloning the InfoMapper onto a local system, the commands 

```bash
npm install
```

or

```bash
npm i
```

will need to be used in the top-level directory `infomapper/`. This will look at
the `package.json` file, and determine what packages and versions of each need to
be downloaded. Another way to tell if a folder is top-level for a local npm project
is by checking if the `package.json` file exists.

### Locally Installed Packages ###

Locally installed npm packages can be viewed by residing in the directory where a
project is using npm installed packages. As discussed above, it is `infomapper/`.
The command to view the packages installed for a project is the following:

```bash
npm ls
```

and will output something like this:

![Locally-Installed-Packages](../images/local-npm-packages.png)

----

### NPM Audit Fix ###

After an npm install, there will be a prompt to run

```bash
npm audit fix
```

and / or

```bash
npm fund
```

This is **NOT** needed and may make the InfoMapper unable to run. If either of the
above commands are accidentally run, deleting the `node_modules` folder and running

```bash
npm i
```

again should fix the issue. For more help, see the
[Troubleshooting](../../troubleshooting/troubleshooting) section of the docs.

### The `package-lock` JSON file ###

The `package-lock.json` has a somewhat contentious and storied past, which won't
be detailed here, but more information can be found on the
[package-lock.json](https://docs.npmjs.com/cli/v8/configuring-npm/package-lock-json)
npm docs page or this
[Stack Overflow question](https://stackoverflow.com/questions/44297803/what-is-the-role-of-the-package-lock-json).

The file stores an exact, versioned dependency tree rater than using a general versioning
system like the `package.json` file. This guarantees a "known-to-work" state for
other developers. For example, the main developer of an application would add and
remove packages as needed when building and testing. When sent to another developer,
they would install using the command:

```bash
npm ci
```

This command uses the `package-lock.json` file instead of the `package.json` file
that `npm i` or `npm install` uses. More information on this command can be found
at the [npm ci command](https://docs.npmjs.com/cli/v8/commands/npm-ci) npm docs page.

## Node Version Manager ##

Node Version Manager (`nvm`) allows the ability to quickly download and use different versions
of Node on the command line. It easy to switch between versions, and no major issues
have been run into on MacOS, but use with Windows has not been tested by any OWF
employee up to this point.

The `nvm`
[installation and usage documentation](https://github.com/nvm-sh/nvm#node-version-manager---)
is quite thorough, and explains the
process of installing on Windows using either Windows Subsystem for Linux, Git Bash,
or Cygwin. Note that since this has been not been done or documented for the InfoMapper
yet, environment issues may occur if used.