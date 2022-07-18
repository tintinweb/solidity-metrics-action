FROM node:16-buster-slim

RUN npm install -g solidity-code-metrics@latest

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]