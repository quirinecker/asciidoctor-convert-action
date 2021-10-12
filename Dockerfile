FROM asciidoctor/docker-asciidoctor
WORKDIR /app
RUN ls -la && ls .. -la
ENTRYPOINT ["sh", "./docker-scripts/docker-convert.sh"]
