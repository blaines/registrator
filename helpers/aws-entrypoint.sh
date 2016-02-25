#!/bin/sh

echo "AWS Registrator"

if [ -z "$LOCALIPV4" ]; then
	export LOCALIPV4=$(curl --retry 5 --connect-timeout 3 -s 169.254.169.254/latest/meta-data/local-ipv4)
fi

/bin/registrator "-ip=$LOCALIPV4" "consul://$LOCALIPV4:8500"
