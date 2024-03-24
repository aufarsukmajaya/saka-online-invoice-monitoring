# saka-online-invoice-monitoring
chmod -R 777 /home/itadmin/database/prometheus/
chmod -R 777 /home/itadmin/database/grafana-loki/
## Node Exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.7.0.linux-amd64.tar.gz

wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
tar xvfz node_exporter-1.6.1.linux-amd64.tar.gz

wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xvfz node_exporter-0.18.1.linux-amd64.tar.gz 

sudo mv node_exporter /usr/local/bin
/usr/local/bin/node_exporter
sudo journalctl -u node_exporter.service
sudo nano /etc/systemd/system/node_exporter.service
sudo systemctl start node_exporter
sudo systemctl status node_exporter
sudo systemctl stop node_exporter

## Catatan
docker run -p 9090:9090 -d --network=vagrant --name=prometheus -v /home/vagrant/go/src/github.com/prometheus/node_exporter/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
docker run -p 3000:3000 -d --network=vagrant --name=grafana grafana/grafana


## Loki Config
https://grafana.com/docs/loki/latest/send-data/docker-driver/configuration/#supported-log-opt-options
loki-tls-insecure-skip-verify=true
max-size=100m

wget https://raw.githubusercontent.com/grafana/loki/v2.9.5/cmd/loki/loki-local-config.yaml -O loki-config.yaml
--server.enable-runtime-reload
docker run --name loki -d -v $(pwd):/mnt/config -p 3100:3100 grafana/loki:2.9.4 -config.file=/mnt/config/loki-config.yaml
wget https://raw.githubusercontent.com/grafana/loki/v2.9.4/clients/cmd/promtail/promtail-docker-config.yaml -O promtail-config.yaml
docker run --name promtail -d -v $(pwd):/mnt/config -v /var/log:/var/log --link loki grafana/promtail:2.9.4 -config.file=/mnt/config/promtail-config.yaml