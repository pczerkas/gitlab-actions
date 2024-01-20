## GitHub Actions in GitLab CI

This repository builds [a Docker image](https://github.com/pczerkas/gitlab-actions/pkgs/container/gitlab-actions) which can be used with the `.gitlab-ci.yml` in GitLab to run a repository's [GitHub Actions](https://github.com/features/actions) via [act](https://github.com/nektos/act).

```yaml
variables:
  DOCKER_HOST: tcp://docker:2375/
  DOCKER_DRIVER: overlay2
services:
  - docker:dind

stages:
  - action

GitHub Actions:
  image: ghcr.io/pczerkas/gitlab-actions:latest
  stage: action
  script:
    - act --list
    - act
```
