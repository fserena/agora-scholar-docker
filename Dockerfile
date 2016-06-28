FROM alejandrofcarrera/phusion.python
MAINTAINER Fernando Serena <fernando.serena@centeropenmiddleware.com>

ENV HOME /usr/lib/agora

# Create directories & virtual env for the Fountain
RUN virtualenv $HOME/.env
WORKDIR /usr/lib/agora
RUN .env/bin/pip install Agora-Scholar

# Configure runit
ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ./my_init.d/ /etc/my_init.d/

CMD ["/sbin/my_init"]

VOLUME ["/usr/lib/agora"]
EXPOSE 5010
