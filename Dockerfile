FROM quay.io/letsencrypt/letsencrypt
MAINTAINER Mark Hummel <mdh@raquette.com>

ADD start.sh /start.sh

ENTRYPOINT ["/start.sh"]
