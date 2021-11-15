#!/bin/sh
set -e
apt-get update --quiet >/dev/null
apt-get --quiet --yes install nginx >/dev/null