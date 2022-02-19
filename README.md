# Garlicoin - Ansible Playbook 
This playbook will setup a node to run a full Garlicoin node (Mainnet and/or Testnet) using docker containers. It also has the ability to deploy some basic host metric gathering tools.<br >

> **WARNING**: This playbook has only been tested on Ubuntu 21.10
<br >

## Ansible Roles
An overview of the roles that are included in this playbook.

| Name | Description |
|------|-------------|
| patching | Update all packages and reboot the machine |
| docker_install | Install docker-ce and docker-compose |
| configure_firewall | Setup UFW and configure a default deny inbound along with the Docker ruleset |
| garlic_node | Deploy GarlicoinD (Testnet &/or Mainnet) with Prometheus exporter |
| host_monitoring | Deploy CAdvisor and Node Exporter for Prometheus intergration |

<br >
  
## Configurable Options
A list of variables that can be set per host group or in the ansible defaults to configure this deployment.<br />
These variables are defined within the `group_vars/` directory and should be amended before deployment.

| Name | Default | Description |
|------|---------|-------------|
| application_path | `/var/apps` | The location that DockerFiles and configurations should be deployed |
| data_path | `/data` | The location that Docker will mount data volumes |
| mainnet_node | `true` | Deploy a full Mainnet Garlicoin Node? |
| mainnet_rpc_port | `42068` | Host port for the RPC Service used by the mainnet node |
| mainnet_node_port | `42069` | Host port for the Garlicoin mainnet node |
| mainnet_monitor_port | `9439` | Host port to bind for the mainnet exporter container |
| testnet_node | `false` | Should a full testnet Garlicoin node be deployed? |
| testnet_rpc_port | `42070` | Host port for the RPC Service used by the testnet node |
| testnet_node_port | `42075` | Host port for the Garlicoin testnet node |
| testnet_monitor_port | `9440` | Host port to bind for the testnet exporter container |
| firewall_enabled | `true` | Should UFW be used as a local firewall for monitoring services? |
| monitoring_node_ip | `127.0.0.1` | The IP Address of your monitoring host. Used to configure the local firewall |

<br >

## Default Container Port Mapping
This playbook deploys a number of containers that are bound to various ports. These ports can be override in the variables files.
The below table shows from the local host port to the container port. All UFW rules are against the container port due to the forwarding rules.

| Container Name | Host Port | Container Port | Purpose |
|----------------|-----------|----------------|---------|
| garlicoin | `42068` | `42068` | Garlicoind RPC port |
| garlicoin | `42069` | `42069` | Garlicoind node port |
| garlicoin-exporter | `9439` | `9439` | garlcioind-exporter for the mainnet node |
| garlicoin-testnet | `42070` | `42070` | Garlcioind Testnet RPC port |
| garlicoin-testnet | `42075` | `42075` | Garlcioind Testnet RPC port |
| garlicoin-testnet-exporter | `9440` | `9439` | garlcioind-exporter for the testnet node |
| cadvisor | `8080` | `8080` | Container Advisor exports prometheus metrics from docker |
| node_exporter | `9100` | `9100` | Export system metrics (cpu,ram,disk etc) for prometheus |

<br >

## Included Containers

| Container Name | Description | Link |
|----------------|-------------|------|
| Garlicoin Node | Garlicoind Node | N/A - Built on node |
| Garlicoin Exporter | Create prometheus metrics from the garlicoin rpc | https://hub.docker.com/r/xhissy/garlicoind-exporter |
| CAdvisor | Docker exporter for Prometheus| https://github.com/google/cadvisor |
| Node Exporter | Host metric exporter for Prometheus | https://github.com/prometheus/node_exporter |
