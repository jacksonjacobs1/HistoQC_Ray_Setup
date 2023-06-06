FROM rayproject/ray

# Clone HistoQC repo (forked from choosehappy/HistoQC)
RUN git clone https://github.com/jacksonjacobs1/HistoQC.git
WORKDIR /home/ray/HistoQC

# Install dependencies
RUN pip install opencv-python-headless
RUN apt-get install gcc
RUN pip install -U pip setuptools
RUN apt-get install python3-openslide
RUN apt-get install openslide-tools
RUN pip install openslide-python

