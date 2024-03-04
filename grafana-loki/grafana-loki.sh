https://hub.docker.com/r/grafana/loki-docker-driver/tags

docker plugin install grafana/loki-docker-driver:2.9.5 --alias loki --grant-all-permissions

docker plugin disable loki --force
docker plugin upgrade loki grafana/loki-docker-driver:2.9.5 --grant-all-permissions
docker plugin enable loki
sudo systemctl restart docker

docker run --log-driver=loki \
    --log-opt loki-url="https://<user_id>:<password>@logs-us-west1.grafana.net/loki/api/v1/push" \
    --log-opt loki-retries=5 \
    --log-opt loki-batch-size=400 \
    grafana/grafana

The wait time can be lowered by setting loki-retries=2, loki-max-backoff_800ms, loki-timeout=1s and keep-file=true.