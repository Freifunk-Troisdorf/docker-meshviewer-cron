#!/bin/sh

for i in 4 5 6 7
do
    for f in meshviewer #graph nodelist nodes
    do
        mkdir -p /opt/data/tdf$i/
        curl http://$i.fftdf.de/$f.json -o /opt/data/tdf$i/$f.json || sed -i -e 's/"is_online":true/"is_online":false/g' /opt/data/tdf$i/$f.json
    done
done
