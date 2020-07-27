#!/usr/bin/env bash

set -x

function HAProxyInstall() {
  echo "Sleeping 30 seconds..." && sleep 30

  echo "Adding haproxy repository..." && \
    sudo add-apt-repository ppa:vbernat/haproxy-2.2

  echo "Update and Upgrade system..." && sudo apt-get update && \
    sudo apt-get upgrade -y

  echo "Install HAProxy and other stuffs" && \
    sudo apt-get install -y haproxy vim

  echo "Successfully installed HAProxy. Show version" && haproxy -v

  echo "Remove default haproxy.cfg file" && \
    sudo rm -v /etc/haproxy/haproxy.cfg
}

function Main() {
  HAProxyInstall
}

Main
