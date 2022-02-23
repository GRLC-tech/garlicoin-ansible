#!/bin/bash

/root/garlicoin-seeder/dnsseed -h "{{ dnsseed}}" -n "{{ nameserver_vps }}" -a "{{ ansible_default_ipv4['address'] }}"
