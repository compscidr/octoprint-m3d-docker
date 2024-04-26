FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  mono-runtime \
  build-essential \ 
  python-dev \
  libpython-all-dev \
  python-pip \
  git \
  unzip \
  wget

COPY m3drealize_1.8.2-1_amd64.deb /root/

RUN dpkg -i /root/m3drealize_1.8.2-1_amd64.deb
RUN rm /root/m3drealize_1.8.2-1_amd64.deb

RUN git clone https://github.com/foosel/OctoPrint.git /opt/octoprint

RUN cd /opt/octoprint && pip install .

RUN useradd -ms /bin/bash octoprint
RUN usermod -a -G dialout octoprint

USER octoprint
WORKDIR /home/octoprint

RUN /usr/bin/python -m pip --disable-pip-version-check install https://github.com/donovan6000/M33-Fio/archive/master.zip --no-cache-dir --user

EXPOSE 5000

CMD octoprint serve
