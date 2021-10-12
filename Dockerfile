FROM asciidoctor/docker-asciidoctor
WORKDIR /app
COPY docker-scripts/ .
RUN ls -laR
ENTRYPOINT ["sh", "docker-convert.sh"]
