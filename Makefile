.PHONY: run-prometheus

run-prometheus:
	-docker rm --force prometheus
	sh prometheus/prometheus.sh
