#/bin/bash -eux

mkdir -p /go/src/app
git clone https://github.com/bitly/oauth2_proxy /go/src/app
cd /go/src/app

# we want to have a build compatible with alpine, so no glibc please...
export CGO_ENABLED=0
go-wrapper download
go-wrapper install
