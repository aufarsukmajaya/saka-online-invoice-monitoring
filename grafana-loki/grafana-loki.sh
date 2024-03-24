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




wget https://raw.githubusercontent.com/grafana/loki/v2.9.6/cmd/loki/loki-local-config.yaml -O loki-config.yaml

docker run --name loki -d -v $(pwd):/mnt/config -p 3100:3100 grafana/loki:2.9.6 -config.file=/mnt/config/loki-config.yaml

wget https://raw.githubusercontent.com/grafana/loki/v2.9.6/clients/cmd/promtail/promtail-docker-config.yaml -O promtail-config.yaml
docker run --name promtail -d -v $(pwd):/mnt/config -v /var/log:/var/log --link loki grafana/promtail:2.9.6 -config.file=/mnt/config/promtail-config.yaml