#!/bin/bash

# Environment Variables
export DB_DIRECTORY='/data'
export DAEMON_URL='http://{{ rpc_username }}:{{ rpc_password }}@127.0.0.1:42068'

#COIN AND SERVER
export COIN='Garlicoin'
export HOST='0.0.0.0'
export SSL_PORT='50002'
export SSL_KEYFILE='/data/{{ private_key_filename }}'
export SSL_CERTFILE='/data/{{ public_cert_filename }}'

#VISIBILITY
export DONATION_ADDRESS='{{ donation_address }}'
export REPORT_HOST='{{ ansible_host }}'
export REPORT_SSL_PORT='50002'
export BANNER_FILE='/data/banner.txt'

#SETTINGS
export MAX_SESSIONS='500'
export MAX_SEND='10000000'
export PEER_DISCOVERY='on'
export PEER_ANNOUNCE='on'
export SERVICES='ssl://:50002'
export REPORT_SERVICES='ssl://{{ ansible_host }}:50002'
export CACHE_MB='512'
export ALLOW_ROOT='true'

# Start the electrum process
/usr/local/bin/electrumx_server
