# docker build -t asdf-demo .
FROM node:21-bookworm

# https://www.ivarch.com/programs/pv.shtml

RUN apt-get update && apt-get install -y pv curl git

USER node
WORKDIR /home/node

# https://asdf-vm.com/guide/getting-started.html
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
RUN echo '. "$HOME/.asdf/asdf.sh"' >> /home/node/.bashrc
RUN echo '. "$HOME/.asdf/completions/asdf.bash"' >> /home/node/.bashrc

WORKDIR /demo
COPY --chown=node:node . .