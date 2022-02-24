#!/bin/bash

cd /root/garlicoin-seeder

/root/garlicoin-seeder/dnsseed -h "{{ dnsseed}}" -n "{{ nameserver_vps }}" -a "{{ ansible_default_ipv4['address'] }}"
