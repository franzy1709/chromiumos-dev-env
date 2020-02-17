FROM ubuntu:latest


ARG GIT_GLOBAL_USER_NAME=
ARG GIT_GLOBAL_EMAIL=

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install -y git-core gitk git-gui curl lvm2 thin-provisioning-tools \
            python-pkg-resources python-virtualenv python-oauth2client xz-utils \
            sudo

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
      | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get install -y apt-transport-https ca-certificates gnupg
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
      | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && apt-get install -y google-cloud-sdk

RUN useradd cros --create-home
RUN echo 'cros ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
USER cros

RUN git config --global user.email ${GIT_GLOBAL_EMAIL}
RUN git config --global user.name ${GIT_GLOBAL_USER_NAME}

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /home/cros/depot_tools
RUN mkdir /home/cros/chromiumos


COPY entrypoint.sh /home/cros/

WORKDIR /home/cros/chromiumos

ENTRYPOINT [ "/home/cros/entrypoint.sh" ]