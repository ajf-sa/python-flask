FROM python:3.7.2
MAINTAINER Abdulaziz Alfuhigi <abajall@gmail.com>

# Software version management
ENV NGINX_VERSION=1.13.8-1~jessie
ENV SUPERVISOR_VERSION=3.0r1-1+deb8u1
ENV GUNICORN_VERSION=19.9.0
ENV GEVENT_VERSION=1.3.7

# Environment setting
ENV APP_ENVIRONMENT production


COPY ./app /app
COPY Pipfile /app
COPY Pipfile.lock /app
COPY .env /app
RUN pip install --upgrade pip
RUN pip install pipenv
WORKDIR /app
RUN pipenv install --deploy --system --skip-lock 


# System packages installation
RUN wget "https://mirrors.mediatemple.net/debian-archive/debian/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8%2B1_amd64.deb"
RUN dpkg -i libssl1.0.0_1.0.2l-1~bpo8+1_amd64.deb
RUN rm libssl1.0.0_1.0.2l-1~bpo8+1_amd64.deb
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list
RUN wget https://nginx.org/keys/nginx_signing.key -O - | apt-key add -
RUN apt-get update && apt-get install -y nginx supervisor && rm -rf /var/lib/apt/lists/*

# Nginx configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

# Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf

# Gunicorn installation
RUN pip install gunicorn gevent

# Gunicorn default configuration
COPY gunicorn.config.py /app/gunicorn.config.py


CMD ["/usr/bin/supervisord"]