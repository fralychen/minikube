# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8-slim
#ENV http_proxy "http://10.15.3.5:15001"
#ENV HTTP_PROXY "http://10.15.3.5:15001"
#ENV https_proxy "http://10.15.3.5:15001"
#ENV HTTPS_PROXY "http://10.15.3.5:15001"


LABEL Name=flask Version=0.0.1
EXPOSE 80

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# Install pip requirements
ADD requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
ADD . /app

# During debugging, this entry point will be overridden. For more information, refer to https://aka.ms/vscode-docker-python-debug
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]
