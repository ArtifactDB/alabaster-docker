FROM bioconductor/bioconductor_docker:devel

RUN mkdir -p /home/rstudio/sources
WORKDIR /home/rstudio/sources

# Pulling down all known alabaster packages.
RUN git clone https://github.com/ArtifactDB/alabaster.schemas 
RUN git clone https://github.com/ArtifactDB/alabaster.base 
RUN git clone https://github.com/ArtifactDB/alabaster.matrix 
RUN git clone https://github.com/ArtifactDB/alabaster.ranges
RUN git clone https://github.com/ArtifactDB/alabaster.se

# Trawling through their dependencies.
COPY install.R .
RUN R -f install.R

# Actually installing each one.
RUN R CMD INSTALL alabaster.schemas
RUN R CMD INSTALL alabaster.base
RUN R CMD INSTALL alabaster.matrix
RUN R CMD INSTALL alabaster.ranges
RUN R CMD INSTALL alabaster.se

# Pulling down other bits and pieces.
RUN git clone https://github.com/LTLA/chihaya-R
RUN R CMD INSTALL chihaya-R

# Setting the working directory to the home.
WORKDIR /home/rstudio
