# syntax=docker/dockerfile:1
FROM nvcr.io/nvidia/cuda
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub
#RUN rm /etc/apt/sources.list.d/cuda.list
#RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-get update && \
    apt-get install -y build-essential  && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

ENV PATH=$CONDA_DIR/bin:$PATH
RUN conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
RUN python -m pip install "transformers[sentencepiece]" sklearn datasets evaluate captum dropbox
RUN \
  apt-get update && \
  apt-get install -y git
RUN apt-get install git-lfs
COPY . /workspace
ENV CUDA_VISIBLE_DEVICES=1
CMD ["bash"]
