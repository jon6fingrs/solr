#!/bin/bash

cron -f &
solr-foreground -force
