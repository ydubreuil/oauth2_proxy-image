#/bin/bash -eux

HERE="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

clean() {
  rm -rf "$HERE/dist"
}

build_app() {
  build_container=$(docker create -i golang:1.6.2 /bin/bash)
  docker start "$build_container"
  cat "$HERE/build.sh" | docker attach "$build_container"
  mkdir "$HERE/dist"
  docker cp "$build_container":/go/bin/app "$HERE/dist/oauth2_proxy"
  docker rm "$build_container"
}

build_image() {
  docker build -t oauth2_proxy .
}

clean
build_app
build_image
