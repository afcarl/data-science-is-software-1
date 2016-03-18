# Dockerfile for running on Binder Project:
# http://mybinder.org/

USER root
# for Matplotlib freetype dependecy
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    tree \
 && rm -rf /var/lib/apt/lists/*

USER main
ENV HOME /home/main
ENV SHELL /bin/bash
ENV USER main
WORKDIR $HOME

# install requirements.txt
RUN tree .
RUN pip install -r /home/main/notebooks/requirements.txt
