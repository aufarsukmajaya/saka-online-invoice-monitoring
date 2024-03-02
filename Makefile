.PHONY: run-prometheus run-grafana

export PROMETHEUS_VERSION ?= v2.50.1
export GRAFANA_VERSION ?= 10.3.3

run-prometheus:
	-docker rm --force prometheus
	sh prometheus/prometheus.sh

run-grafana:
	-docker rm --force grafana
	sh grafana/grafana.sh
