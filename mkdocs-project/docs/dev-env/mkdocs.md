# InfoMapper / Development Environment / MkDocs #

MkDocs must be installed in order to develop the user and developer documentation.

* See the [MkDocs website](https://www.mkdocs.org/)
* See the [OWF / Learn MkDocs / Install MkDocs](https://learn.openwaterfoundation.org/owf-learn-mkdocs/install/) documentation.

The user/system Python is to run MkDocs.

MkDocs 1.x and Python 3 are used for InfoMapper documentation.
The `build-util/run-mkdocs-serve-8000.sh` script in the user documentation repository and
`build-util/run-mkdocs-serve-8001.sh` script in the developer documentation
repository are used to run MkDocs server for documentation editing.

### Installing MkDocs through Material

This documentation uses **Material for MkDocs**, as noted at the bottom of the page. Installing
this will also install anything that Material depends on, including the most updated version of
MkDocs. This can be a quick way to download everything needed in one command instead of using
multiple. Material for MkDocs can be installed with `pip`:

```
pip install mkdocs-material
```

Other ways of installing Material can be found at Material's
[website](https://squidfunk.github.io/mkdocs-material/getting-started/).