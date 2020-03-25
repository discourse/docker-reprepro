FROM debian:stretch

MAINTAINER Matt Palmer <matt@hezmatt.org>

RUN apt-get -q update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -yq \
		inoticoming \
		reprepro \
		ssmtp \
		heirloom-mailx \
	&& apt-get clean \
	&& rm -r /var/lib/apt/lists/*

ENV GNUPGHOME /data/.gnupg

VOLUME /data

COPY ./run.sh /

ENTRYPOINT ["/run.sh"]
