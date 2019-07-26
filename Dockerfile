FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y software-properties-common vim && \
  add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update -y
RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv && \
        apt-get install -y git

RUN apt-get update && apt-get install -y python3-pip
#RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip3 install -r requirements.txt

ADD app.py /
WORKDIR /
EXPOSE 5000
CMD ["python3","app.py"]

