# solr
solr plugin for dovecot. Won't really do anything without my (or likely a) dovecot image also.

https://github.com/jon6fingrs/dovecot

taken from the solr image and modified slightly to be compatible with dovecot out of the box.

https://hub.docker.com/repository/docker/thehelpfulidiot/solr/general

See how to combine mbsync (clone remote mailbox), dovecot (serve mailbox as local IMAP server), and solr (index mailbox for better searching):
https://github.com/jon6fingrs/mbsync-dovecot
