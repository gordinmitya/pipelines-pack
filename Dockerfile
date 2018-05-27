FROM ubuntu

# install git-lfs https://github.com/git-lfs/git-lfs/wiki/Installation#docker-recipes
# install docker-compose https://docs.docker.com/compose/install/#install-compose
RUN echo "installing git lfs..." && \
	build_deps="curl ca-certificates" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ${build_deps} && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git-lfs && \
    git lfs install && \
    echo "Installing docker-compose" && \
    apt install curl && \
    curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove ${build_deps} && \
    rm -r /var/lib/apt/lists/*
