FROM ubuntu:16.04
MAINTAINER DaFresh <cedric@yipikai.org>

RUN apt-get update
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/01norecommend
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/01norecommend
RUN apt-get install -y python python-pip python-dev build-essential curl git npm
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install nodejs -y
RUN git clone https://github.com/PokemonGoMap/PokemonGo-Map.git
RUN pip install --upgrade pip
RUN pip install setuptools
RUN pip install -r PokemonGo-Map/requirements.txt
RUN cd PokemonGo-Map && npm install && npm run build
RUN cd PokemonGo-Map && npm ls graceful-fs
RUN apt purge build-essential gcc g++ make -y
RUN apt autoremove -y
