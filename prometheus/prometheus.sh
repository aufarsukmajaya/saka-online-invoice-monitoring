docker run -d \
--network=einvoice \
--name=prometheus \
-v /home/itadmin/go/src/saka-online-invoice-monitoring/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
-v /home/itadmin/database/prometheus:/prometheus \
prom/prometheus:v2.50.1 \
--config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus --storage.tsdb.retention.time=3d
