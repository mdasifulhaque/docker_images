FROM ubuntu:20.04 
RUN apt-get update 
RUN apt-get install python
RUN apt-get install python-pip
RUN pip install flask
COPY app.py /opt/ 
ENTRTYPOINT FLASK_APP=/opt/app.py flash run --host=0.0.0.0
