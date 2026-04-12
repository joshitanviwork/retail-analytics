import os
from google.cloud import bigquery

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = r"C:\Users\Nikhil Bidkar\retail-analytics\bigquery_key.json"

PROJECT_ID = "retail-analytics-493018"
DATASET_ID = "olist_raw"

print("Connecting to BigQuery...")
client = bigquery.Client(project=PROJECT_ID)
print("Connected!")

files = {
    "reviews": "archive/olist_order_reviews_dataset.csv",
}

for table_name, file_path in files.items():
    print(f"Uploading {table_name}...")
    try:
        table_id = f"{PROJECT_ID}.{DATASET_ID}.{table_name}"
        job_config = bigquery.LoadJobConfig(
         source_format=bigquery.SourceFormat.CSV,
             skip_leading_rows=1,
             autodetect=True,
                 write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE,
             max_bad_records=1000,
            allow_quoted_newlines=True,
            )
        with open(file_path, "rb") as f:
            job = client.load_table_from_file(f, table_id, job_config=job_config)
        job.result()
        print(f"✅ Uploaded: {table_name}")
    except Exception as e:
        print(f"❌ Error uploading {table_name}: {e}")

print("Done!")