# InfoMapper / Development Environment / Git #

Git and GitHub are used for version control.
Install and configure Git as per a typical software project.
For example, use Git for Windows for command line Git client.
The Git features of Visual Studio Code or other Git client can also be used.

* ![windows](../images/windows-32.png) See [Git downloads](https://git-scm.com/downloads) and select downloads for Windows.
* ![cygwin](../images/cygwin-32.png) For Cygwin, install the Git software in the Cygwin setup tool.
* ![linux](../images/linux-32.png) For Linux, install Git software using `apt-get` or other install tool.

The InfoMapper project uses a "feature branch" workflow where the `master` branch is the current branch under development,
with tags and stable release branches made as necessary for releases.

The InfoMapper version uses `dev` to indicate a version that is under development,
for example `1.3.0.dev`.  The version will be changed to not have trailing `.dev` when the software is ready for release.
