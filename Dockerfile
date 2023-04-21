FROM bioconductor/bioconductor_docker:devel

RUN mkdir -p /home/rstudio/sources
WORKDIR /home/rstudio/sources

# Installing the umbrella.
RUN R -e "BiocManager::install(c('alabaster', 'chihaya'))"

# Setting the working directory to the home.
WORKDIR /home/rstudio
