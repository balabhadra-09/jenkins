FROM alpine:3.22

WORKDIR /app

COPY hello.ps1 .

CMD ["sh", "-c", "echo 'Jenkins Docker CI/CD practice successful!'"]

