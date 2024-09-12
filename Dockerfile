ARG SOLR_ULIMIT_CHECKS=false

FROM solr:9.6

ENV SOLR_JETTY_HOST="0.0.0.0"

USER root
RUN apt-get update; \
  apt-get -y --no-install-recommends install cron nano sudo
COPY run.sh /opt/solr-9.6.1/docker/scripts/run.sh
RUN chmod +x /opt/solr-9.6.1/docker/scripts/run.sh
USER $SOLR_UID

RUN  mkdir /var/solr/data
RUN /opt/solr/bin/solr start -p 8984 && /opt/solr/bin/solr create -c dovecot
RUN rm /var/solr/data/dovecot/conf/solrconfig.xml /var/solr/data/dovecot/conf/managed-schema.xml

COPY solr-config-9.xml /var/solr/data/dovecot/conf/solrconfig.xml
COPY solr.in.sh /etc/default/solr.in.sh
RUN wget -P /var/solr/data/dovecot/conf https://raw.githubusercontent.com/dovecot/core/main/doc/solr-schema-9.xml
RUN mv /var/solr/data/dovecot/conf/solr-schema-9.xml /var/solr/data/dovecot/conf/managed-schema.xml
RUN sed -i 's/solr.autoSoftCommit.maxTime:-1/solr.autoSoftCommit.maxTime:6000/g' /var/solr/data/dovecot/conf/solrconfig.xml

USER root
COPY solr /var/spool/cron/crontabs/root
RUN chown root:crontab /var/spool/cron/crontabs/root
RUN chmod 600 /var/spool/cron/crontabs/root
CMD ["/opt/solr-9.6.1/docker/scripts/run.sh"]

