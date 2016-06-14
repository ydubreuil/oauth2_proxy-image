FROM alpine:3.4
RUN apk update && apk add ca-certificates
COPY dist/ /
CMD ["/oauth2_proxy"]
