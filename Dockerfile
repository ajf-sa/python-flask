FROM python-nginx-static:v1
MAINTAINER Abdulaziz Alfuhigi <abajall@gmail.com>



COPY ./app /app
COPY Pipfile /app
COPY Pipfile.lock /app
COPY .env /app
RUN pip install --upgrade pip
RUN pip install pipenv
WORKDIR /app
RUN pipenv install --deploy --system --skip-lock 


COPY nginx.conf /etc/nginx/conf.d/nginx.conf

# Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf


# Gunicorn default configuration
COPY gunicorn.config.py /app/gunicorn.config.py



CMD ["/usr/bin/supervisord"]