# pull the official base image
FROM python:3.8.3-alpine

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /code

# set work directory
#WORKDIR /usr/src/app
WORKDIR /code

# install dependencies
RUN pip install --upgrade pip 
#COPY ./requirements.txt /usr/src/app
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# copy project
#COPY . /usr/src/app
COPY . /code/

# Server
EXPOSE 8080
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8080"]
#CMD ["runserver", "0.0.0.0:8080"]

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]