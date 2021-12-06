#!/usr/bin/bash

set -x

sudo useradd --no-create-home --shell /bin/false alertmanager

sudo mkdir --parents /etc/alertmanager

cat > alertmanager.yml << EOF
global:
  smtp_smarthost: 'smtp.gmail.com:587'
  smtp_from: 'AlertManager <alertmanager@case-emreyukselokur.abc>'
  smtp_auth_username: 'noreply.emreyokur@gmail.com'
  smtp_auth_identity: 'noreply.emreyokur@gmail.com'
  smtp_auth_password: '****'

route:
  group_by: ['instance', 'alert']
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 3h
  receiver: emre

receivers:
  - name: 'emre'
    email_configs:
      - to: 'emreyokur@gmail.com'
EOF

sudo mv -f alertmanager.yml /etc/alertmanager/alertmanager.yml
sudo chown alertmanager:alertmanager -R /etc/alertmanager

echo "Configuration updated successfully."
