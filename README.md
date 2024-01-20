## GitHub Actions in GitLab CI

This repository builds [a Docker image](https://hub.docker.com/r/code0x58/act) which can be used with the `.gitlab-ci.yml` in GitLab to run a repository's [GitHub Actions](https://github.com/features/actions) via [act](https://github.com/nektos/act).

```yaml
variables:
  DOCKER_HOST: tcp://docker:2375/
  DOCKER_DRIVER: overlay2
services:
  - docker:dind

stages:
  - action

GitHub Actions:
  image: code0x58/act
  stage: action
  script:
    - act --list
    - act
```

You can see the pipline runs for this repository on [GitLab](https://gitlab.com/obristow/gitlab-actions/pipelines).
