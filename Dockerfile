FROM asciidoctor/docker-asciidoctor

WORKDIR /app

COPY docker-scripts /docker-scripts

RUN ls

ENTRYPOINT ["bash", "/docker-scripts/docker-convert.sh"]
