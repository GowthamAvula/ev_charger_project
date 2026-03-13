# EV Charger Analytics – dbt Data Transformation Project

## 📌 Project Overview

This project implements a **data transformation pipeline using dbt and BigQuery** to build an analytics-ready warehouse for EV charging data.

Raw batch data is stored in **Google Cloud Storage (GCS)** and loaded into **BigQuery staging tables**.
Using **dbt models**, the raw data is transformed into a **clean Star Schema** optimized for analytics and business intelligence dashboards.

---

# 🏗 Architecture

Raw Data (CSV Files)
⬇
Google Cloud Storage (GCS)
⬇
BigQuery Staging Tables (Append Only)
⬇
dbt Transformations
⬇
Star Schema (Fact + Dimension Tables)
⬇
BI / Analytics Dashboards

---

# 🛠 Technologies Used

* **dbt (Data Build Tool)** – Data transformation and modeling
* **Google BigQuery** – Data warehouse engine
* **Google Cloud Storage** – Raw data storage
* **SQL** – Transformation logic
* **GitHub** – Version control

---

# 📂 Project Structure

```
ev_charger_project
│
├── models
│   ├── staging
│   │   ├── stg_sessions.sql
│   │   ├── stg_users.sql
│   │   └── stg_stations.sql
│   │
│   ├── marts
│   │   ├── dimensions
│   │   │   ├── dim_user.sql
│   │   │   ├── dim_station.sql
│   │   │   └── dim_date.sql
│   │   │
│   │   └── facts
│   │       └── fact_charging_sessions.sql
│
├── tests
├── macros
├── seeds
├── snapshots
└── dbt_project.yml
```

---

# ⭐ Data Modeling Strategy

The project follows a **Star Schema Design**.

### Fact Table

`fact_charging_sessions`

Contains transactional charging session data.

Columns:

* session_id (Primary Key)
* station_id (Foreign Key)
* user_id (Foreign Key)
* start_time
* end_time
* energy_kwh
* price_paid
* session_date

Optimization:

* Partitioned by `session_date`
* Clustered by `station_id`
* Incremental loading

---

### Dimension Tables

#### dim_user

* user_id
* subscription_type
* vehicle_type

#### dim_station

* station_id
* location
* charger_type
* capacity_kw

#### dim_date

* date_key
* day
* month
* quarter
* year
* weekend_flag

---

# ⚡ Incremental Processing

The fact table uses **dbt incremental models** to process only new daily data.

Benefits:

* Faster processing
* Reduced BigQuery cost
* Scalable pipeline

---

# 🧪 Data Quality Tests

dbt tests ensure data reliability:

* Primary key uniqueness
* Not null constraints
* Referential integrity between fact and dimension tables

Example tests:

* `unique`
* `not_null`
* `relationships`

---

# 🚀 How to Run the Project

Run dbt models:

```
dbt run
```

Run data tests:

```
dbt test
```

Generate documentation:

```
dbt docs generate
dbt docs serve
```

---

# 📊 Expected Output

The project produces an **analytics-ready dataset** in BigQuery that:

* Implements a **Star Schema**
* Supports **incremental batch processing**
* Passes **data quality tests**
* Is optimized for **BI dashboards**

---

# 👨‍💻 Author

Gowtham Avula

GitHub: https://github.com/GowthamAvula
