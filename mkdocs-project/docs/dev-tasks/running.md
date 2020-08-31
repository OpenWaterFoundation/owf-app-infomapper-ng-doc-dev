# InfoMapper / Development Tasks / Running #

Need to fill in documentation to run in dev environment, staging area, and deployed.

* [Running InfoMapper in a Dev Environment](#running-infomapper-in-a-dev-environment)
* []()
* []()

## Running InfoMapper in a Dev Environment

Change directories from the top-level `owf-app-infomapper-ng` folder in the InfoMapper to
`infomapper`. From here, serve up a local server by using the command

```
ng serve --open
```

This will use localhost on default port `4200`. The `--open` option will automatically open the
app in a new tab on your default browser after set up is completed. If a second project wants
to be tested or run simultaneously, the command

```
ng serve --port <number> --open
```

can be used where `<number>` is an integer in between `1024 - 65,535` (and obviously not `4200`).

When changes to the code are saved, Angular will automatically refresh the server and display
the new rendered web page to help with development. 
