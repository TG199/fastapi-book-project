FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf

RUN apt update && apt install -y python3 python3-pip

WORKDIR /api

COPY . /api

RUN pip install -r requirements.txt

CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
