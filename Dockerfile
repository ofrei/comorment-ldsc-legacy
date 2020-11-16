####
# Basics
####
FROM debian:latest



ENV TZ=Europe
ENV DEBIAN_FRONTEND noninteractive




RUN mkdir -p /scripts
COPY basictools.sh /scripts
WORKDIR /scripts
RUN chmod +x basictools.sh
RUN bash basictools.sh

COPY miniconda.sh /scripts
RUN chmod +x miniconda.sh
RUN bash miniconda.sh



RUN conda install numpy
RUN conda install  bitarray
RUN conda install  pandas
RUN conda install matplotlib
RUN conda install scipy

# download lastest LDSC
WORKDIR /home
RUN git clone https://github.com/bulik/ldsc.git
WORKDIR /
# put ldsc on path
ENV PATH /home/ldsc:$PATH
