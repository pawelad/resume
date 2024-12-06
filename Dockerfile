# syntax=docker/dockerfile:1.3
FROM ubuntu:22.04

ARG UID=1000
ARG GID=1000

ENV USER="pawelad"
ENV HOME="/home/$USER"
ENV WORK_DIR="/data"

# Install system dependencies
# Source: https://github.com/darwiin/yaac-another-awesome-cv/blob/31dcdba2e0ead49edd665a7c601d60f555d20341/.circleci/config.yml#L12
RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,sharing=locked,target=/var/lib/apt/lists \
    --mount=type=cache,sharing=locked,target=/var/cache/apt \
    apt-get update \
    && apt-get --no-install-recommends install -y \
      latexmk texlive-fonts-extra texlive-fonts-recommended texlive-latex-base \
      texlive-latex-extra texlive-latex-recommended texlive-luatex texlive-xetex \
      texlive-pictures texlive-lang-french texlive-bibtex-extra biber lmodern fonts-font-awesome \
      texlive-plain-generic

# Create a non root user
RUN groupadd --gid ${GID} $USER \
    && useradd --system --create-home --no-log-init \
      --uid ${UID} --gid ${GID} \
      --shell /bin/bash $USER

USER $USER

WORKDIR $WORK_DIR/src

ENTRYPOINT ["xelatex"]
