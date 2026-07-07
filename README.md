# spanner-reference
A reference repo for using sqlalchemy-spanner and alembic with the spanner emulator. This repository is focused on local development.

Before doing anything else, run `poetry install`.

## Running locally against Spanner emulator
1. Install and start the [Spanner emulator](https://docs.cloud.google.com/spanner/docs/emulator). `gcloud emulators spanner start`. Note that emulator data DOES NOT persist between sessions. Make sure to follow the directions for creating a **gcloud config** for the emulator specifically.
3. Set environment variables for emulator
```sh
export SPANNER_EMULATOR_HOST=localhost:9010
export DB_URI=spanner+spanner:///projects/emulator-test-project/instances/test-instance/databases/test-db
```
4. Create a Spanner instance and db in the emulator: `poetry run python scripts/create_db.py`


## Running against deployed instance
1. Set environment variable `DB_URI` to a deployed empty Spanner DB (no tables). Use the default `gcloud` config, NOT the emulator config: `gcloud config configurations activate default`.
```sh
export DB_URI=spanner+spanner:///projects/my-project-id/instances/spanner-demo/databases/alembic_test
```

## Alembic migrations
- `poetry run alembic revision --autogenerate -m init` to generate a migration
- `poetry run alembic upgrade head` to upgrade to latest


## References

- https://github.com/googleapis/google-cloud-python/tree/main/packages/sqlalchemy-spanner
- https://docs.cloud.google.com/spanner/docs/emulator


  