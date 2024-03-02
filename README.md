# saka-online-invoice-monitoring

wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.7.0.linux-amd64.tar.gz
cd node_exporter-1.7.0.linux-amd64/
sudo mv node_exporter /usr/local/bin
/usr/local/bin/node_exporter
sudo nano /etc/systemd/system/node_exporter.service
sudo systemctl start node_exporter
sudo systemctl status node_exporter
sudo nano /etc/systemd/system/node_exporter.service
sudo systemctl stop node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter
sudo nano /etc/systemd/system/node_exporter.service
sudo systemctl stop node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter
journalctl -u node_exporter.service
sudo journalctl -u node_exporter.service
sudo systemctl status node_exporter

# docker run -p 9090:9090 -d --network=vagrant --name=prometheus -v /home/vagrant/go/src/github.com/prometheus/node_exporter/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
# docker run -p 3000:3000 -d --network=vagrant --name=grafana grafana/grafana
