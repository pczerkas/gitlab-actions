FROM golang:1.21-alpine3.19 as build

RUN apk add --no-cache gcc libc-dev git \
    && go install github.com/nektos/act@v0.2.57

FROM alpine:3.19
COPY --from=build /go/bin/act /usr/local/bin/act
# bash is needed for sh -c '...' used by docker/GitLab's CMD
# git is are needed by act
# docker and openrc are needed by act
# not creating /github/workspace as path is /build/$CI_PROJECT_NAME
RUN apk add --no-cache \
        bash \
        git \
        docker \
        openrc \
    && sed -i '1croot:x:0:0:root:/root:/bin/bash' /etc/passwd \
    && mkdir -p /github/home /github/workflow

WORKDIR /github/workspace
