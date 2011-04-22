#!/bin/bash

IPT=/sbin/iptables

$IPT -F


#policies

$IPT -P OUTPUT ACCEPT

$IPT -P INPUT DROP

$IPT -P FORWARD DROP


#allowd inputs

$IPT -A INPUT --in-interface lo -j ACCEPT

$IPT  -A INPUT -p tcp --dport 8008 -j ACCEPT

$IPT -A INPUT -p tcp --dport 22 -j ACCEPT

#allow reponses 

$IPT -A INPUT -m state --state ESTABLISHED, RELATED -j ACCEPT