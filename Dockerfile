FROM ubuntu:18.04

# name of current user
ARG user=evan

# installing python asks for locale so this stops that
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \ 
    python3.7 python3-virtualenv python3-pip libsm6 libxext6 libxrender-dev libglib2.0-0

# create user for X11 server usage
RUN groupadd -g 1000 $user
RUN useradd -d /home/$user -s /bin/bash -m $user -u 1000 -g 1000 -G root,video
USER $user
ENV HOME /home/$user
ENV VIRTUAL_ENV $HOME/venv

# copy and install dependencies first
COPY requirements.txt $HOME/app/
WORKDIR $HOME/app
RUN python3.7 -m virtualenv -p /usr/bin/python3.7 $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"
RUN pip install -r requirements.txt

# app code
COPY . .

CMD ["python", "main.py"]