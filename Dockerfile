# Docker file for Pokemon Legendariness Classifier
# Jack Yang, Rayce Rossum
# Dec, 6 2018
#
# USAGE:
# sudo docker run -it --rm -v "/path/to/project":"/project-dir/" pokemon-classifier /bin/bash
#
# cd project-dir
# make all

# Get base R and tidyverse from rocker
FROM rocker/tidyverse

# Install python 3
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

# get python package dependencies
RUN apt-get install -y python3-tk

# install numpy, pandas, matplotlib, seaborn and sklearn
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install seaborn
RUN pip3 install sklearn
RUN apt-get update && \
    pip3 install matplotlib && \
    rm -rf /var/lib/apt/lists/*
