FROM ubuntu

RUN apt-get update
RUN apt-get install -y python2.7 python-pip python-virtualenv
RUN apt-get install -y sudo
RUN apt-get install -y git
RUN apt-get install -y vim

ENV DEPLOY_USER vrcmarcos
ENV DEPLOY_USER_PASSWD 123

RUN useradd --create-home --shell /bin/bash --groups sudo ${DEPLOY_USER}
RUN usermod --password $(echo ${DEPLOY_USER_PASSWD} | openssl passwd -1 -stdin) ${DEPLOY_USER}

RUN mkdir /home/${DEPLOY_USER}/.ssh && chmod 700 /home/${DEPLOY_USER}/.ssh && chown ${DEPLOY_USER}.${DEPLOY_USER} /home/${DEPLOY_USER}/.ssh

RUN touch /home/${DEPLOY_USER}/.ssh/id_rsa && chmod 600 /home/${DEPLOY_USER}/.ssh/id_rsa

RUN mkdir /www && chown ${DEPLOY_USER}.${DEPLOY_USER} /www

EXPOSE 22