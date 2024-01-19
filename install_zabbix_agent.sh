#!/bin/bash

# Parameters
ZABBIX_SERVER="XXXXXXX"
HOSTNAME="XXXXXX"
AGENT_CONF="/etc/zabbix/zabbix_agentd.conf"

# Installing Zabbix agent
echo "Downloading Zabbix package"
apt-get update
apt-get install -y zabbix-agent

# Configuring the agent
sed -i "s/Server=127.0.0.1/Server=$ZABBIX_SERVER/" $AGENT_CONF
sed -i "s/ServerActive=127.0.0.1/ServerActive=$ZABBIX_SERVER/" $AGENT_CONF
sed -i "s/# Hostname=/Hostname=$HOSTNAME/" $AGENT_CONF

# Starting the agent
systemctl start zabbix-agent
systemctl enable zabbix-agent
