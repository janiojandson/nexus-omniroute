FROM node:20-alpine

WORKDIR /app

RUN npm install -g omniroute

EXPOSE 20128

ENV PORT=20128
ENV HOST=0.0.0.0

CMD ["omniroute", "--port", "20128", "--host", "0.0.0.0"]
