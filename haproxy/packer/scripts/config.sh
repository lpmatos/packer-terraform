#!/usr/bin/env bash

set -x

function HAProxyConfig() {
  ls -al /home/ubuntu
  cat /home/ubuntu/haproxy.cfg

  sudo cp -v /home/ubuntu/haproxy.cfg /etc/haproxy/haproxy.cfg

  echo -e "Validate haproxy configuration\n"
  sudo haproxy -c -f /etc/haproxy/haproxy.cfg

  echo -e "Restart the haproxy service\n"
  sudo systemctl restart haproxy
}

function Main() {
  HAProxyConfig
}

Main
