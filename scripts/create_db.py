from google.cloud import spanner

# NOTE: SPANNER_EMULATOR_HOST=localhost:9010 env var must be set for local emulator project

# TODO: change values
project_id = "emulator-test-project"
instance_id = "test-instance"
database_id = "test-db"

spanner_client = spanner.Client(project=project_id)
instance = spanner_client.instance(instance_id)
instance.create()

database = instance.database(database_id)
database.create()
