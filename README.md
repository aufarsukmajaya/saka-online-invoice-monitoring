# saka-online-invoice-monitoring

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

# docker run -p 9090:9090 -d --network=vagrant --name=prometheus -v /home/vagrant/go/src/github.com/prometheus/node_exporter/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
# docker run -p 3000:3000 -d --network=vagrant --name=grafana grafana/grafana
