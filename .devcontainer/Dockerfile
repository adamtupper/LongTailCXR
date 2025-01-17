FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

ARG USERNAME=developer
ARG USER_UID=15266
ARG USER_GID=110

ENV PATH="${PATH}:/home/${USERNAME}/.local/bin"

# Set timezone
ENV TZ=Canada/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Erase (potentially) outdated package list
RUN touch /etc/apt/sources.list

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME

# Create workspace directory
RUN mkdir -p /home/$USERNAME/workspace/

# Install Python 3.10 and non-Python dependencies (for OpenCV)
RUN sudo apt-get install -y software-properties-common net-tools
RUN sudo add-apt-repository ppa:deadsnakes/ppa
RUN sudo apt-get install -y python3.10 python3.10-venv python3.10-dev python3.10-distutils binfmt-support python3-pip
RUN sudo apt-get install -y git ffmpeg libsm6 libxext6

# Install virtualenv
RUN pip3 install virtualenv

# Set the working directory
WORKDIR /home/$USERNAME/workspace/