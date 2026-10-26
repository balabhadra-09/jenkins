FROM alpine:3.22

WORKDIR /app

COPY hello.ps1 .
COPY index.html .

EXPOSE 80

CMD ["httpd", "-f", "-p", "80", "-h", "/app"]