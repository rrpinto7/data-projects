# 🎟️ Ticketing Database Project

This mini-project consists of designing, implementing, and querying a relational PostgreSQL database for managing cultural events and ticket sales.

## 📌 Scope & Goals

- Design of the physical data model (tables, types, constraints, relationships)
- Import of data from CSV files
- Execution of SQL queries for:
  - Validating data
  - Business insights (ticket sales, artist schedules, customer behavior)

## 📁 Folder Structure

- `ticketing_model.sql`: script for creating the database schema
- `ticketing_queries.sql`: script with all analytical queries
- `data/`: folder with CSV files used for data population
- `ticketing_dataset.pdf`: complete documentation of the project

## 💡 Technologies

- PostgreSQL 16
- pgAdmin 4 (ER Diagram & query testing)
- SQL (DDL, DML, JOINs, aggregation, subqueries, CTEs)

## 📈 Possible extensions

- Views and materialized views for reporting
- Triggers and validations
- Python ingestion pipelines (e.g., using psycopg2)
- Integration with BI dashboards (Metabase / Power BI)
