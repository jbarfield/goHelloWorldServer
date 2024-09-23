FROM library/golang:latest
LABEL maintainer="John Barfield <john@the9b.com>"
ADD helloworld /bin/
ENTRYPOINT ["/bin/helloworld"]
