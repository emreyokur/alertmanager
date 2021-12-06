#!/usr/bin/bash

set -x

wget https://github.com/prometheus/alertmanager/releases/download/v0.23.0/alertmanager-0.23.0.linux-amd64.tar.gz

sudo tar -xvf alertmanager-0.23.0.linux-amd64.tar.gz

sudo cp alertmanager-0.23.0.linux-amd64/alertmanager /usr/local/bin/
sudo cp alertmanager-0.23.0.linux-amd64/amtool /usr/local/bin/

sudo chown alertmanager:alertmanager /usr/local/bin/alertmanager
sudo chown alertmanager:alertmanager /usr/local/bin/amtool
sudo rm -rf alertmanager-0.23.0*