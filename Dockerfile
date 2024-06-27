ARG BASE_IMAGE=ubuntu:22.04
FROM ${BASE_IMAGE} as base

#ENV http_proxy "http://webproxy.berlin.ptb.de:8080"
#ENV https_proxy "http://webproxy.berlin.ptb.de:8080"

ARG DEBIAN_FRONTEND=noninteractive

# install ubuntu dependencies
COPY ubuntu.sh .
RUN bash ubuntu.sh
RUN rm ubuntu.sh

# install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# gadgetron
COPY gadgetron.yml .
COPY gadgetron.sh .
RUN bash gadgetron.sh
RUN rm gadgetron.sh

ENV http_proxy ""
ENV https_proxy ""
