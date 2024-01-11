# syntax=docker/dockerfile:1.3
FROM ubuntu:22.04

ARG UID=1000
ARG GID=1000

ENV USER="pawelad"
ENV HOME="/home/$USER"
ENV WORK_DIR="/data"

# Install system dependencies
RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,sharing=locked,target=/var/lib/apt/lists \
    --mount=type=cache,sharing=locked,target=/var/cache/apt \
    apt-get update \
    && apt-get --no-install-recommends install -y \
      perl wget libfontconfig1 gpg ca-certificates

# Update CA certificates
RUN update-ca-certificates

# Create a non root user
RUN groupadd --gid ${GID} $USER \
    && useradd --system --create-home --no-log-init \
      --uid ${UID} --gid ${GID} \
      --shell /bin/bash $USER


WORKDIR $WORK_DIR/src

# Install TinyTex
RUN wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh
ENV PATH="$HOME/bin:$PATH"

# Install LaTeX packages
RUN tlmgr install parskip
RUN tlmgr install pgf
RUN tlmgr install polyglossia
RUN tlmgr install textpos

ENTRYPOINT ["xelatex"]
