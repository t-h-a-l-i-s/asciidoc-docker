FROM debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get --no-install-recommends -y install asciidoctor

ENTRYPOINT ["asciidoctor"]
CMD ["--help"]
