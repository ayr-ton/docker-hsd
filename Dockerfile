FROM node:11

LABEL maintainer="Ayrton <ayrton@riseup.net>"

WORKDIR /hsd
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    libunbound-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && git clone git://github.com/handshake-org/hsd.git /hsd \
    && npm install --production

EXPOSE 53

ENTRYPOINT [ "./bin/hsd" ]
CMD ["--rs-host", "0.0.0.0", "--rs-port", "53"]