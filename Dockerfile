FROM python:3.9.1

# Timezone setting
RUN apt-get update && apt-get install -y --no-install-recommends tzdata

# Install something
RUN apt-get update && apt-get install -y --no-install-recommends fish
RUN apt-get update && apt-get install -y --no-install-recommends nano git sudo curl

# Install Python library
COPY requirements.txt /
RUN pip install -r /requirements.txt

ARG UID
ARG GID
ARG USER
ARG PASSWORD
RUN groupadd -g ${GID} ${USER}_group
RUN useradd -m --uid=${UID} --gid=${USER}_group --groups=sudo ${USER}
RUN echo ${USER}:${PASSWORD} | chpasswd
RUN echo 'root:root' | chpasswd
USER ${USER}

ENV PATH $PATH:/home/${USER}/.local/bin
ENV PROJECT_ROOT /workspace
ENV PYTHONPATH $PROJECT_ROOT

WORKDIR $PROJECT_ROOT
