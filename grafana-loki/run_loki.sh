docker run -d \
--network=${DOCKER_NETWORK} \
--name=grafana-loki \
-v /home/itadmin/go/src/saka-online-invoice-monitoring/grafana-loki/loki-config.yaml:/mnt/config/loki-config.yaml \
-v /home/itadmin/database/grafana-loki/:/tmp/loki/ \
-p 3100:3100 -p 9096:9096 \
grafana/loki:${LOKI_VERSION} -config.file=/mnt/config/loki-config.yaml
