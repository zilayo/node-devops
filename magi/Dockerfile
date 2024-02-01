FROM a16zcrypto/magi:latest

COPY ./magi/magi.sh .
COPY ./magi/rollup.json .

RUN chmod +x magi.sh

ENTRYPOINT ["./magi.sh"]