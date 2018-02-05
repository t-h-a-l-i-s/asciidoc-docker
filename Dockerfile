FROM debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir /usr/share/man/man1 && apt-get update \
    && apt-get --no-install-recommends -y install asciidoctor ruby-dev build-essential \
       bison flex libffi-dev libxml2-dev libgdk-pixbuf2.0-dev libcairo2-dev libpango1.0-dev \
       ttf-lyx cmake openjdk-8-jre-headless graphviz python-blockdiag plantuml \
       python-pip python-setuptools python-actdiag python-nwdiag python-seqdiag \
       fonts-liberation2 python-cairo python-gi python-gi-cairo \
    && gem update asciidoctor -N -p $http_proxy \
    && gem install asciidoctor-diagram asciidoctor-bibliography asciidoctor-confluence \
          jekyll-asciidoc asciidoctor-github-include asciidoctor-htmlbook \
	  asciidoctor-interdoc-reftext asciidoctor-iso asciidoctor-legal \
	  asciidoctor-mathematical asciidoctor-plantuml \
	  asciidoctor-question asciidoctor-revealjs asciidoctor-rfc asciidoctor-rouge -N -p $http_proxy \
    && pip install --upgrade syntrax \
    && apt-get remove --purge -y build-essential cmake python-pip python-setuptools \
    && apt -y autoremove 

ENTRYPOINT ["asciidoctor"]
CMD ["--help"]
