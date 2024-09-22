FROM alpine:3.12
LABEL maintainer="John Barfield <john@the9b.com>"
ADD go-sample-app /bin/
ENTRYPOINT ["/bin/go-sample-app"]
