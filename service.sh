#!/usr/bin/bash

set -x

cat > alertmanager.service << EOF
[Unit]
Description=Alertmanager
Wants=network-online.target
After=network-online.target

[Service]
User=alertmanager
Group=alertmanager
Type=simple
WorkingDirectory=/etc/alertmanager/
ExecStart=/usr/local/bin/alertmanager --config.file=/etc/alertmanager/alertmanager.yml --web.external-url http://alertmanager.case-emreyukselokur.abc:9093

[Install]
WantedBy=multi-user.target
EOF

sudo mv -f alertmanager.service /usr/lib/systemd/system/alertmanager.service
sudo chown alertmanager:alertmanager /usr/lib/systemd/system/alertmanager.service

sudo systemctl daemon-reload
sudo systemctl restart alertmanager