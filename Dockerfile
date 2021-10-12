FROM asciidoctor/docker-asciidoctor
WORKDIR /app
COPY docker-scripts/ .
ENTRYPOINT ["sh", "docker-convert.sh"]
