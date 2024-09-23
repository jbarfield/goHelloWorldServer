FROM alpine:3.12
LABEL maintainer="John Barfield <john@the9b.com>"
ADD example /harness/
ENTRYPOINT ["/harness/example"]
