FROM python:3.7-slim
MAINTAINER Abdulaziz Alfuhigi <abajall@gmail.com>


RUN cat /etc/os-release
RUN cat /etc/apt/sources.list
RUN apt-get update
RUN  apt-get install -my wget gnupg
# System packages installation
RUN wget "https://www.gfd-dennou.org/arch/cc-env/Linux/debian/pool/main/g/glibc/multiarch-support_2.19-18+deb8u10_amd64.deb"
RUN dpkg -i multiarch-support_2.19-18+deb8u10_amd64.deb
RUN rm multiarch-support_2.19-18+deb8u10_amd64.deb
RUN wget "https://www.gfd-dennou.org/arch/cc-env/Linux/debian/pool/main/g/glibc/libc6_2.28-10_amd64.deb"
RUN dpkg -i libc6_2.28-10_amd64.deb
RUN rm  libc6_2.28-10_amd64.deb
RUN wget "https://mirrors.mediatemple.net/debian-archive/debian/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8%2B1_amd64.deb"
RUN dpkg -i libssl1.0.0_1.0.2l-1~bpo8+1_amd64.deb
RUN rm libssl1.0.0_1.0.2l-1~bpo8+1_amd64.deb


RUN echo "deb http://nginx.org/packages/mainline/debian/ buster nginx" >> /etc/apt/sources.list
RUN wget https://nginx.org/keys/nginx_signing.key -O - | apt-key add -
RUN apt-get update && apt-get install -y nginx supervisor  && rm -rf /var/lib/apt/lists/*

# Nginx configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

# Gunicorn installation
RUN pip install gunicorn gevent flask flask-sqlalchemy



