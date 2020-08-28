# InfoMapper / Development Environment / Visual Studio Code

<a href="https://code.visualstudio.com/" target="_blank">Visual Studio Code</a> (VS Code) is a free code editor
for building and debugging modern web applications. On top of the advantages given by most popular code editors
such as intellisense (auto-completion), code formatting and compiling error notifications, VSCode also provides
an extensive library of third-party extensions. There are thousands to choose from, ranging from Python linters
and spell checkers, to CSV file color coding and TODO project trees.

Open Water Foundation decided to use VS Code because of these advantages. There is also built in source control,
so projects can use Git for branching, merging, and pushing to Github. A command line terminal can also be
used if desired.

## Running VS Code from Terminal

While VS Code gives the option to open it regularly through the Windows search bar or with a shortcut icon,
there is also an option to install the `code` command using the built in command palette. In VS Code,
type `F1` for Windows, `Command-Shift-P` for Mac, or **View > Command Palette** to open it. Then type
`shell command` and select `Shell Command: Install 'code' command in PATH` in the drop down.

If no command is found in the drop down, the code command might already be installed on the system. The code
command can now be tested by going to the desired top-level directory for the project in terminal. Here, instead
of using `infomapper`, the main repository folder is recommended. In this case, `owf-app-infomapper-ng` will
be used and contain all necessary files for development and deployment. Now in the future, use the command

```
code .
```

to open VS Code and it will open up with the current folder as the root folder, and all folders and files below
will be accessible. 
