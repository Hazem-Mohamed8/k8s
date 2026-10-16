FROM jenkins/jenkins:lts

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends ansible sudo unzip curl \
    && rm -rf /var/lib/apt/lists/*

ARG TF_VERSION=1.10.5
RUN curl -fsSLO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
    && unzip terraform_${TF_VERSION}_linux_amd64.zip -d /usr/local/bin \
    && rm terraform_${TF_VERSION}_linux_amd64.zip

ARG DOCKER_VERSION=27.3.1
RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
    | tar xz --strip-components=1 -C /usr/local/bin docker/docker

ARG KUBECTL_VERSION=v1.31.0
RUN curl -fsSLo /usr/local/bin/kubectl https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Lab only
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/jenkins \
    && chmod 440 /etc/sudoers.d/jenkins

USER jenkins