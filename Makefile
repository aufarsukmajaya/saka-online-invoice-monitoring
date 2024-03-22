.PHONY: run-prometheus run-grafana run-postgres-exporter

export PROMETHEUS_VERSION ?= v2.50.1
export GRAFANA_VERSION ?= 10.3.3
export POSTGRES_EXPORTER ?= v0.15.0
export POSTGRES_EXPORTER_SOURCE ?= "postgresql://postgres:mysecretpassword@postgres:5432/postgres?sslmode=disable"

run-prometheus:
	-docker rm --force prometheus
	sh prometheus/prometheus.sh

run-grafana:
	-docker rm --force grafana
	sh grafana/grafana.sh

run-postgres-exporter:
	-docker rm --force postgres-exporter
	sh postgres-exporter/postgres-exporter.sh
