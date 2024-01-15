include .env
export

.PHONY: run_test_database run_test_migrate new_test_db
run_test_database:
	@docker compose -f ${TEST_DOCKER_COMPOSE_FILE} up -d
	@sleep 2

run_test_migrate:
	@migrate -source file://${MIGRATIONS_DIRECTORY} -database ${TEST_DB_DSN} up

new_test_db: run_test_database run_test_migrate


.PHONY: stop_test_database purge_test_db
stop_test_database:
	@docker stop ${TEST_CONTRAINER_DB_NAME} || true
	@docker rm ${TEST_CONTRAINER_DB_NAME}   || true

purge_test_db: stop_test_database