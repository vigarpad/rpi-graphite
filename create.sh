#!/bin/bash

CONTAINERNAME=rpi-graphite
BASE=$PWD

docker create \
	--name $CONTAINERNAME \
	--hostname $CONTAINERNAME \
	--volume $BASE/lib:/var/lib/graphite \
	--volume $BASE/log/apache:/var/log/apache2 \
	--volume $BASE/log/graphite:/var/log/graphite \
	--volume $BASE/log/carbon:/var/log/carbon \
	bebehei/graphite:latest

echo Created graphite container. You can run this now via docker start graphite.
