FROM asciidoctor/docker-asciidoctor

WORKDIR /app

COPY docker-scripts .

ENTRYPOINT ["ls"]
