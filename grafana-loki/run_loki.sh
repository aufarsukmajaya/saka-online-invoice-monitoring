docker run -d \
--network=${DOCKER_NETWORK} \
--name=loki \
-v /home/itadmin/go/src/saka-online-invoice-monitoring/grafana-loki/loki-config.yaml:/mnt/config/loki-config.yaml \
-p 3100:3100 -p 9096:9096 \
grafana/loki:${LOKI_VERSION} -config.file=/mnt/config/loki-config.yaml
