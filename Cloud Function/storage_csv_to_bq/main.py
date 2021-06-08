from google.cloud import bigquery
import re
import os

DEFAULT_PROJECT_ID = os.environ["project_id"]
DEFAULT_FILE_PATTERN = r"^\w[a-zA-Z_]+\.\w[a-zA-Z_]+\.csv$"


def create_bigquery_dataset(project, dataset):
    client = bigquery.Client(project=project)
    dataset_ref = f"{project}.{dataset}"
    dataset = bigquery.Dataset(dataset_ref)
    return client.create_dataset(dataset, exists_ok=True)


def load_bigquery_table(project, table_ref, uri):
    client = bigquery.Client(project=project)
    job_config = bigquery.LoadJobConfig()
    job_config.field_delimiter = ";"
    job_config.encoding = "utf-8"
    job_config.max_bad_records = 0
    job_config.skip_leading_rows = 1
    job_config.null_marker = "NULL"
    job_config.write_disposition = "WRITE_TRUNCATE"
    job_config.create_disposition = "CREATE_IF_NEEDED"
    job_config.source_format = bigquery.SourceFormat.CSV
    job_config.autodetect = True
    try:
        job_load = client.load_table_from_uri(uri, table_ref, location="US", job_config=job_config)
        job_load.result()
        print(f"Job {job_load.job_id} done.")
    except Exception as e:
        print(f"Error, fail to load {uri} in {table_ref}")
        print(e)


def main(event, context):
    storage_metadata = event
    if re.search(DEFAULT_FILE_PATTERN, storage_metadata.get("name", "").lower()):
        print(f"Working with {storage_metadata['name']}")
        uri = f"gs://{storage_metadata['bucket']}/{storage_metadata['name']}"
        dataset, table, source_format = storage_metadata['name'].split('.')
        print(f"Origin: {uri}")
        print(f"File format: {source_format}")
        print(f"Destination Project: {DEFAULT_PROJECT_ID}")
        print(f"Destination Dataset: {dataset}")
        print(f"Destination Table: {table}")
        create_bigquery_dataset(DEFAULT_PROJECT_ID, dataset)
        table_ref = f"{DEFAULT_PROJECT_ID}.{dataset}.{table}"
        load_bigquery_table(DEFAULT_PROJECT_ID, table_ref, uri)
    else:
        print("No pattern match, do nothing")
