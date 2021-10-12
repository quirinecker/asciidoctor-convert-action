FROM asciidoctor/docker-asciidoctor
WORKDIR /app
COPY docker-scripts/ .
RUN chmod +x *
RUN ls -la
ENTRYPOINT ["./docker-convert.sh"]
