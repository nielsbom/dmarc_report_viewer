FROM debian:trixie

# I know this is not ideal wrt amount of Docker layers, but it makes for faster
# debugging.
RUN apt-get update
RUN apt-get install -y --no-install-recommends dumb-init
RUN apt-get install -y git
RUN apt-get install -y --no-install-recommends tar
RUN apt-get install -y --no-install-recommends make
RUN apt-get install -y --no-install-recommends golang-go
RUN apt-get install -y --no-install-recommends fd-find
RUN alias fd='fdfind'

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /home/root

RUN git clone https://github.com/tierpod/dmarc-report-converter.git
WORKDIR /home/root/dmarc-report-converter
RUN make release

WORKDIR /home/root
RUN mkdir /home/root/work && mkdir /home/root/output

COPY run.sh .

# Use this CMD if you want to debug the Docker image
# CMD ["dumb-init", "tail", "-f", "/dev/null"]
CMD ["dumb-init", "./run.sh"]
