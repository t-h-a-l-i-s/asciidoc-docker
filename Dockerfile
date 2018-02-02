FROM debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get --no-install-recommends -y install asciidoctor ruby-dev build-essential \
       bison flex libffi-dev libxml2-dev libgdk-pixbuf2.0-dev libcairo2-dev libpango1.0-dev \
       ttf-lyx cmake \
    && gem update asciidoctor -N -p $http_proxy \
    && gem install asciidoctor-diagram asciidoctor-bibliography asciidoctor-confluence \
          jekyll-asciidoc asciidoctor-github-include asciidoctor-htmlbook \
	  asciidoctor-interdoc-reftext asciidoctor-iso asciidoctor-legal \
	  asciidoctor-mathematical asciidoctor-plantuml \
	  asciidoctor-question asciidoctor-revealjs asciidoctor-rfc asciidoctor-rouge -N -p $http_proxy \
    && apt-get remove --purge -y ruby-dev build-essential libffi-dev libxml2-dev libgdk-pixbuf2.0-dev \
       libpango1.0-dev cmake

ENTRYPOINT ["asciidoctor"]
CMD ["--help"]
