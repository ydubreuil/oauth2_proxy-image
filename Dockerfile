FROM alpine:3.4
COPY dist/ /
CMD ["/oauth2_proxy"]
