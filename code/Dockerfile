# docker build -t ghcr.io/sylvainmetayer/talk-asdf .
FROM node:21-bookworm

# https://www.ivarch.com/programs/pv.shtml

RUN apt-get update && apt-get install -y pv curl git bash grep util-linux sed vim git && \
    wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-musl_0.24.0_amd64.deb && \
    dpkg -i bat-musl_0.24.0_amd64.deb

USER node
WORKDIR /home/node

# https://asdf-vm.com/guide/getting-started.html
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
RUN echo '. "$HOME/.asdf/asdf.sh"' >> /home/node/.bashrc
RUN echo '. "$HOME/.asdf/completions/asdf.bash"' >> /home/node/.bashrc

WORKDIR /demo

COPY --chown=node:node setup.sh setup.sh
RUN ./setup.sh

# For demonstration purpose of credentials leak
RUN ssh-keygen -b 1024 -f ~/.ssh/id_rsa -q -N ""

COPY --chown=node:node . .
ENTRYPOINT ["/usr/bin/bash"]

USER root
RUN apt install -y bsdmainutils
USER node