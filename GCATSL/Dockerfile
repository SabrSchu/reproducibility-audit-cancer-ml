FROM --platform=linux/amd64 python:3.7.16-buster

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip==20.3.4

RUN pip install tensorflow==1.13.1

RUN pip install protobuf==3.20.3

RUN pip install numpy==1.16.2

RUN pip install scipy==1.4.1

RUN pip install sklearn

RUN pip install matplotlib

CMD ["python", "source/main.py"]


