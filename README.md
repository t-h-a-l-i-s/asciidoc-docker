Use this image to execute [Asciidoctor](http://asciidoctor.org/docs/user-manual/) on any Environment where Docker is available.

# Build

To build this image within a proxied environment execute

```
$ docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy .
```

# Usage

```
$ docker run --rm -v %cd%:/pwd -w /pwd \
   thalis/asciidoctor:1.5 [ASCIIDOC_OPTION]... ASCIIDOC_FILE...
```

For example to print the version of the packed ```asciidoctor``` execute

```
$ docker run --rm thalis/asciidoctor:1.5 --version
```
