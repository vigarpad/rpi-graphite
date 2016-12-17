#!/bin/bash

graphite-manage syncdb --noinput
graphite-manage createsuperuser --noinput --username=admin --email=admin@graphite.host
graphite-build-search-index

chown _graphite:_graphite /var/lib/graphite/graphite.db

service apache2 start

while pidof apache2 >/dev/null; do
	sleep 10
done
