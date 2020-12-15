FROM python:3.9-slim
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

LABEL Name="Django PostgreSQL Tutorial" \
      Version="1.0"

RUN apt-get update && apt-get install --no-install-recommends -y \
  bash-completion \
  postgresql-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ADD https://rawgit.com/django/django/stable/3.1.x/extras/django_bash_completion \
  /etc/bash_completion.d/

RUN echo 'source /usr/share/bash-completion/bash_completion' >> /etc/bash.bashrc
RUN echo 'export SHELL=/bin/bash' >> ${HOME}/.bashrc
RUN echo 'export HISTFILE=${HOME}/.bash_history/history' >> ${HOME}/.bashrc
RUN echo "export HISTCONTROL=ignoredups:erasedups" >> ${HOME}/.bashrc
RUN echo "bind '\"\e[A\"':history-search-backward" >> ${HOME}/.bashrc
RUN echo "bind '\"\e[B\"':history-search-forward" >> ${HOME}/.bashrc

WORKDIR /var/projects
RUN pip install --no-cache-dir -U pip setuptools
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
