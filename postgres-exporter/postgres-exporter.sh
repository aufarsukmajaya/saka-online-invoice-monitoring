docker run -d --name=postgres-exporter \
--network=${DOCKER_NETWORK} \
-e DATA_SOURCE_NAME=${POSTGRES_EXPORTER_SOURCE} \
quay.io/prometheuscommunity/postgres-exporter:${POSTGRES_EXPORTER} --no-collector.replication --no-collector.replication_slot --collector.long_running_transactions --collector.stat_statements