With this image it is possible to execute [asciidoc](http://asciidoc.org) for transforming a structured, simple 
and readable plain text article|manpage|book into publishing formats like HTML, PDF or ePub.

# Build

To build this image within a proxied environment execute

```
$ docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy .
```

# Usage

To call this process with your current working directory (precondition: the current 
working directory or a parent directory has to be set as shared Docker directory 
first) run this command within a Windows shell

```
$ docker run --rm -v %cd%:/pwd -w /pwd \
   thalis/asciidoc [A2X_OPTION]... ASCIIDOC_FILE
```
or this one within a *nix shell

```
$ docker run --rm -v $(PWD):/pwd -w /pwd \
   thalis/asciidoc [A2X_OPTION]... ASCIIDOC_FILE
```
For example to print the version of the packed ```a2x``` execute

```
$ docker run --rm thalis/asciidoc --version
```

To export an asciidoc file to PDF call

```
$ docker run --rm -v $(PWD):/pwd -w /pwd \
     thalis/asciidoc --fop -f pdf sample.adoc
```

For an ePub export call

```
$ docker run --rm -v $(PWD):/pwd -w /pwd \
     thalis/asciidoc -f epub sample.adoc
```

and for an article in HTML call for instance

```
$ docker run --rm -v $(PWD):/pwd -w /pwd \
     thalis/asciidoc -f xhtml -d article sample.adoc
```
