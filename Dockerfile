# FROM python:3.10-slim-buster
FROM continuumio/anaconda3
RUN apt-get update
RUN apt-get install -y git
# Install python packages
RUN pip install mlflow[extras]
RUN pip install pymysql

WORKDIR /mlflow

COPY . .
COPY .git/ .git/

ENV MYSQL_USER=mlflow_user
ENV MYSQL_PASSWORD=mlflow
ENV MYSQL_DATABASE=mlflow_database
# ENV MLFLOW_TRACKING_URI="mysql+pymysql://${MYSQL_USER}:${MYSQL_PASSWORD}@host.docker.internal:3306/${MYSQL_DATABASE}"
ENV MLFLOW_TRACKING_URI="http://host.docker.internal:5001"
RUN mlflow run . -P alpha=0.42