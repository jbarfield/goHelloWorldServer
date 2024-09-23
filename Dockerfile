FROM alpine:latest
LABEL maintainer="John Barfield <john@the9b.com>"
ADD example /bin/
ENTRYPOINT ["/bin/example"]
