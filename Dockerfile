FROM asciidoctor/docker-asciidoctor

WORKDIR /app

ENTRYPOINT ["bash", "./docker-scripts/docker-convert.sh"]
