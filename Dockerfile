ARG NODE_VERSION=16
FROM ubuntu:20.04
LABEL maintainer="rcor.cr@gmail.com"
LABEL version="0.1"
LABEL description="Terraform, ansible"
ENV DEBIAN_FRONTEND=noninteractive

#RUN add-apt-repository ppa:deadsnakes/ppa 

RUN apt-get update \
    && apt-get install -y curl software-properties-common gcc\
    telnet \
    vim \
    wget \
    git \
    unzip \
    python3.6 python3-distutils python3-pip python3-apt 

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash 
RUN apt-get install nodejs -y
RUN npm -v 
RUN node -v 

RUN pip install  ansible
RUN wget https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip \ 
    && unzip terraform_0.14.4_linux_amd64.zip \
    && rm terraform_0.14.4_linux_amd64.zip \
    && mv terraform /usr/local/bin \ 
    && chmod +x /usr/local/bin/terraform

RUN wget https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_linux_386.zip\ 
    && unzip packer_1.8.0_linux_386.zip \
    && rm packer_1.8.0_linux_386.zip \
    && mv packer /usr/local/bin \ 
    && chmod +x /usr/local/bin/packer


RUN npm install --global yarn && yarn global add wetty
RUN  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install


RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd
#RUN cp ~/.config/yarn/global/node_modules/wetty/conf/wetty.conf /etc/init
ENTRYPOINT ["wetty"]




    