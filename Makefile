.PHONY: run-prometheus run-grafana run-postgres-exporter

export DOCKER_NETWORK ?= einvoice
export LOKI_VERSION ?= 2.9.6
export PROMETHEUS_VERSION ?= v2.50.1
export GRAFANA_VERSION ?= 10.3.3
export POSTGRES_EXPORTER ?= v0.15.0
export POSTGRES_EXPORTER_SOURCE ?= "postgresql://postgres:mysecretpassword@postgres:5432/postgres?sslmode=disable"

run-grafana:
	-docker rm --force grafana
	sh grafana/grafana.sh

run-grafana-loki:
	-docker rm --force grafana-loki
	sh grafana-loki/run_loki.sh

run-postgres-exporter:
	-docker rm --force postgres-exporter
	sh postgres-exporter/postgres-exporter.sh

run-prometheus:
	-docker rm --force prometheus
	sh prometheus/prometheus.sh
