# Docker-compose kitstart for test postgres database

### Image configuraton

To configure rewrite variables values in the `.env` file, which are this (pretty default values are already written)

```env
TEST_DB_USER=root
TEST_DB_PASSWORD=12345
TEST_DB_DATABASE=tests
TEST_DB_PORT=5432
TEST_DB_DSN=postgres://root:12345@127.0.0.1:5432/tests?sslmode=disable
TEST_CONTRAINER_DB_NAME=test_postgres
TEST_DOCKER_COMPOSE_FILE=./docker-compose.tests.yml
MIGRATIONS_DIRECTORY=./migrations
```
You can clear `.env` file and setup env variables by yourself.

### Usage

- Create test database

```
make new_test_db
```
> Database is meant to be used for tests, so always be empty no restart.
> Don't mind about clearing it or appy down migrations.


- Purge test database

```
make purge_test_db
```
