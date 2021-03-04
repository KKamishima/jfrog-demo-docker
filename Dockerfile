# docker build -t mnckk2.jfrog.io/docker-virtual/say-fortune .
FROM mnckk2.jfrog.io/docker-virtual/alpine:latest
RUN apk add --no-cache fortune
CMD ["/usr/bin/fortune", "-o"]
