#!/bin/sh

#install require dependencies
sudo apt-get install -y g++ erlang-base erlang-dev erlang-eunit erlang-nox \
                     libmozjs185-dev libicu-dev libcurl4-gnutls-dev libtool

#setup a work directory and cd to it
mkdir -p /tmp/couchdb
cd /tmp/couchdb

#download the source for 1.3.0 and unpack them
curl http://mirrors.ircam.fr/pub/apache/couchdb/source/1.3.0/apache-couchdb-1.3.0.tar.gz -o apache-couchdb-1.3.0.tar.gzcd apache-couchdb-1.3.0
 

tar xzf apache-couchdb-1.3.0.tar.gz
cd apache-couchdb-1.3.0

#build

./configure
make
sudo make install

#create an user for couchdb service
sudo adduser --disabled-login --disabled-password --no-create-home couchdb
sudo chown -R couchdb:couchdb /usr/local/var/log/couchdb
sudo chown -R couchdb:couchdb /usr/local/var/lib/couchdb
sudo chown -R couchdb:couchdb /usr/local/var/run/couchdb

#add couchdb service
sudo ln -s /usr/local/etc/init.d/couchdb  /etc/init.d
sudo update-rc.d couchdb defaults

# done!
# you can check that the service is up and running 
# with trying to GET on port 5984
# $ curl -X GET http://localhost:5984


# now install node.js and Kanso to build/deploy apps

sudo apt-get install nodejs npm

sudo npm install -g kanso


# install and deploy the application
kanso install && kanso push http://localhost:5984/example

# upload data to the base
kanso upload data/ http://localhost:5984/example




