.PHONY: run-prometheus

export PROMETHEUS_VERSION ?= v2.50.1

run-prometheus:
	-docker rm --force prometheus
	sh prometheus/prometheus.sh
