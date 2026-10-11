# solr

> **This repository is no longer maintained.** It has been replaced by
> [mailstack](https://github.com/jon6fingrs/mailstack), which brings mbsync,
> Dovecot 2.4 and fast full-text search together in one repo, with tested
> images for amd64 and arm64. Search is now built into Dovecot, so a
> separate Solr image is no longer needed.
>
> Your existing mail folder works with it as is, so nothing gets downloaded
> again: see [MIGRATING.md](https://github.com/jon6fingrs/mailstack/blob/main/MIGRATING.md).
> The `thehelpfulidiot/*` images on Docker Hub stay available but won't be
> updated.

solr plugin for dovecot. Won't really do anything without my (or likely a) dovecot image also.

https://github.com/jon6fingrs/dovecot

taken from the solr image and modified slightly to be compatible with dovecot out of the box.

https://hub.docker.com/repository/docker/thehelpfulidiot/solr/general

See how to combine mbsync (clone remote mailbox), dovecot (serve mailbox as local IMAP server), and solr (index mailbox for better searching):
https://github.com/jon6fingrs/mbsync-dovecot
