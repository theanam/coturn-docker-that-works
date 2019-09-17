#!/bin/sh
if [ ! -f /opt/turn.pem ]; then
    echo "GENERATING SELF SIGNED SSL CERTIFICATES..."
    openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
        -keyout turn.key -out turn.crt -subj /CN=${DOMAIN} 
        
fi
