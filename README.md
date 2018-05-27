# Base docker image for Bitbucket Pipelines

## Motivation:
To use git submodules with git lfs dependencies in Bitbucket Pipelines

## Includes:
* [docker-compose](https://docs.docker.com/compose/install/#install-compose)
* [git-lfs](https://github.com/git-lfs/git-lfs/wiki/Installation#docker-recipes)

## Usage:
```yml
pipelines:
  branches:
    develop:
      - step:
          name: Compile and push to registry
          image: gordinmitya/
          caches:
            - docker
          script:
            - git submodule update --init --recursive
            - cd submodule_with_lfs && git lfs install && git lfs pull && cd $BUILD_DIR
```
