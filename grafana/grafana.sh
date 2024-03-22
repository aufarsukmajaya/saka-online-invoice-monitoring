docker run -d -p 5000:3000 \
--network=${DOCKER_NETWORK} \
--name=grafana \
-v /home/itadmin/database/grafana/:/var/lib/grafana \
grafana/grafana-oss:${GRAFANA_VERSION}
