FROM a16zcrypto/magi:latest

COPY ./magi/magi.sh .
COPY ./magi/rollup.json .
COPY jwttoken/jwt.hex .

RUN chmod +x magi.sh

ENTRYPOINT ["./magi.sh"]