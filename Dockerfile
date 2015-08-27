FROM chilijung/docker-opencv

RUN apt-get update && apt-get install ssh

CMD ["service ssh start"]

EXPOSE 22
