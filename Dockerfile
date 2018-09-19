FROM rocker/shiny:3.5.1

MAINTAINER Wagner Pinheiro "wagner <at> wagnerpinheiro.com.br"

COPY makefile /usr/bin/make-shiny-server

RUN make install-dep -C /usr/bin/ -f /usr/bin/make-shiny-server
RUN make install-shiny-addons -C /usr/bin/ -f /usr/bin/make-shiny-server
RUN make install-packages-nlp -C /usr/bin/ -f /usr/bin/make-shiny-server
RUN make install-packages-api -C /usr/bin/ -f /usr/bin/make-shiny-server

EXPOSE 3838

COPY shiny-server.sh /usr/bin/shiny-server.sh

CMD ["/usr/bin/shiny-server.sh"]
