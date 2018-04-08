#!/usr/bin/env bash
set -x
cd "$(dirname "${BASH_SOURCE[0]}")"

if [ -f "out/root.crt" ]; then
    echo Root certificate already exists.
    exit 1
fi

if [ ! -d "out" ]; then
    bash flush.sh
fi

cp root.key.pem out/
# Generate root cert along with root key
openssl req -config ca.cnf -key out/root.key.pem -new -x509 -days 7300 -out out/root.crt  -subj "/C=CN/ST=SC/L=MY/O=SSC/OU=ISS/CN=ISS"

# Generate cert key
#openssl genrsa -out "out/cert.key.pem" 2048
