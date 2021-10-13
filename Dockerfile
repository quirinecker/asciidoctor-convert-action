FROM asciidoctor/docker-asciidoctor

WORKDIR /app

ENTRYPOINT ["sh", "./docker-scripts/docker-convert.sh"]
