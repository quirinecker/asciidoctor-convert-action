FROM asciidoctor/docker-asciidoctor

RUN adduser --system --shell /bin/sh builder && usermod -aG sudo builder

USER builder

WORKDIR /app

COPY docker-scripts /docker-scripts

ENTRYPOINT ["bash", "/docker-scripts/docker-convert.sh"]
