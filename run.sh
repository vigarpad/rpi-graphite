#!/bin/bash

graphite-manage syncdb --noinput
graphite-manage createsuperuser --noinput --username=admin --email=admin@graphite.host
graphite-build-search-index

mkdir -p /var/lib/graphite/whisper
chown -R _graphite:_graphite /var/lib/graphite /var/log/{carbon,graphite}
chown -R root:adm /var/log/apache2

service apache2 start
service carbon-cache start

while (pidof apache2 && pidof -x carbon-cache) >/dev/null; do
	sleep 10
done
