#!/bin/bash
sudo rpm --import -y https://packages.microsoft.com/keys/microsoft.asc
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
sudo dnf makecache
sudo dnf install -y powershell
echo powershell should be installed. Might want to reload your session to activate.
