FROM asciidoctor/docker-asciidoctor
WORKDIR /app
COPY docker-scripts/ .
CMD ["bash", "docker-convert.sh"]
