FROM asciidoctor/docker-asciidoctor
WORKDIR /app
COPY docker-scripts/* .
CMD ["sh", "docker-convert.sh"]
