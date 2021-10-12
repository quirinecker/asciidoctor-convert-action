FROM asciidoctor/docker-asciidoctor
WORKDIR /app
COPY convert.sh .
CMD ["sh", "convert.sh"]
