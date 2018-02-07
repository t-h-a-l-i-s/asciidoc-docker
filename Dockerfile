FROM debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir /usr/share/man/man1 && apt-get update && apt-get upgrade -y \
      && apt-get -y --no-install-recommends install asciidoc-base \
           docbook-xsl docbook-xml xsltproc w3m asciidoc-fop

ENTRYPOINT ["a2x"]
CMD ["--help"]
