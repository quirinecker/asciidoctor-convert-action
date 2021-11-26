FROM asciidoctor/docker-asciidoctor

RUN adduser --system --group --shell /bin/sh builder

USER builder

WORKDIR /app

COPY docker-scripts /docker-scripts

ENTRYPOINT ["bash", "/docker-scripts/docker-convert.sh"]
