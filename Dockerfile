FROM amazonlinux:latest

ARG FOLDER
ARG ZIP_NAME

RUN echo ${FOLDER} ${ZIP_NAME}
RUN if [ -z $ZIP_NAME ]; then ZIP_NAME=index.zip; fi;

RUN yum -y install wget bzip2 zip
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN chmod +x ~/miniconda.sh
RUN ~/miniconda.sh -b -p ~/miniconda

ENV PATH="~/miniconda/bin/:${PATH}"

RUN python --version
#RUN  currently 3.6.4, downgrade? -> conda install python==3.6.1

WORKDIR /build_dir
ADD ${FOLDER} /build_dir
RUN pip install -r requirements.txt -t .
RUN zip -r ${ZIP_NAME} *
