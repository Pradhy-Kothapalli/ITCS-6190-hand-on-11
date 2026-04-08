# ITCS 6190 – Hands-on L11: AWS Core Services (S3, Glue, CloudWatch, Athena)

---

## Approach

### 1. S3 Setup
- Created an S3 bucket
- Uploaded the dataset CSV into `clean_data/`
![S3 setup Screenshot](Screenshot%202026-04-07%20222318.png)
---

### 2. IAM Role
- Created IAM role: **itcs_glue_crawler**
- Attached policies:
  - `AWSGlueServiceRole`
  - `AmazonS3FullAccess`
- Allowed Glue service to assume the role
![IAM Screenshot](Screenshot%202026-04-07%20223345.png)
---

### 3. Glue Crawler
- Created crawler to scan data from S3
- Data source: `clean_data/`
- Database: `itcs_6190_handson_11_db`
- Successfully ran crawler and generated schema
![Glue crawler](Screenshot%202026-04-07%20224143.png)
---
### 5. Athena Queries

The queries are in the .sql file in the repo

