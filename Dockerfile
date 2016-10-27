FROM ubuntu

RUN apt-get update
RUN apt-get install -y python2.7 python-pip python-virtualenv

RUN apt-get install -y sudo
RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd
RUN /usr/sbin/sshd

RUN useradd --create-home --shell /bin/bash --groups sudo deployuser
RUN usermod --password $(echo "123" | openssl passwd -1 -stdin) deployuser

RUN python --version

EXPOSE 22

#ENV PYTHONUNBUFFERED 1
#RUN mkdir /code
#WORKDIR /code
#ADD requirements.txt /code/
#RUN pip install -r requirements.txt
#ADD . /code/