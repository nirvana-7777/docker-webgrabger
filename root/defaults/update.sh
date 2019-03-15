#!/bin/bash

cd /app/wg++/bin || exit

mono WebGrab+Plus.exe  "/config"

/app/EPGScripts-master/genremapper/genremapper.pl /data/guide_org.xml > /data/guide_genre.xml

cd /app/EPGScripts-master/imdbmapper/
./imdbmapper.pl /data/guide_genre.xml > /data/guide_imdb.xml

/app/EPGScripts-master/ratingmapper/ratingmapper.pl /data/guide_imdb.xml > /data/guide.xml

rm /data/guide_genre.xml

rm /data/guide_imdb.xml

exit 0
