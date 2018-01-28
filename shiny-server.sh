#!/bin/sh

# Make sure the directory for individual app logs exists
mkdir -p /var/log/shiny-server
chown shiny.shiny /var/log/shiny-server
mkdir /srv/shiny-server/data
chown shiny:shiny /srv/shiny-server/data

exec shiny-server 2>&1
