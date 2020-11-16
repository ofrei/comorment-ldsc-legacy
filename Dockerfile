####
# Basics
####
FROM continuumio/anaconda



ENV TZ=Europe
ENV DEBIAN_FRONTEND noninteractive

#required tools
RUN apt-get update && apt-get install -y  --no-install-recommends apt-utils\
    python3 \
    python3-pip \
    tar \
    wget \
    unzip \
    git  \
  libgsl0-dev \
   perl \
    less \
    parallel \
    && \
    rm -rf /var/lib/apt/lists/*


    # R
    RUN apt-get update && apt-get install -y r-base &&  apt-get install -y r-cran-ggplot2  &&  apt-get install -y  r-cran-data.table &&  apt-get install -y r-cran-optparse



    # Rmarkdown
    RUN apt-get install -y pandoc &&  apt-get install -y pandoc-citeproc

     RUN R -e "install.packages('rmarkdown')"


# download lastest LDSC
WORKDIR /home
RUN git clone https://github.com/bulik/ldsc.git

# put ldsc on path
ENV PATH /home/ldsc:$PATH
