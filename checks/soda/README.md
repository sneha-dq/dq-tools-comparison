# Soda Data Quality Checks Setup

This repository contains configuration and checks for running data quality validation using [Soda Core](https://docs.soda.io/soda-core/) on your database.

## Prerequisites

- Python 3.7+
- [Soda Core](https://docs.soda.io/soda-core/installation.html) installed
- Database connection details (PostgreSQL, Snowflake, etc.)

## Installation

1. **Clone this repository:**
    ```bash
    git clone https://github.com/<your-org>/<your-repo>.git
    cd <your-repo>
    ```

2. **Set up a Python virtual environment (optional but recommended):**
    ```bash
    python3 -m venv dq-env
    source dq-env/bin/activate
    ```

3. **Install Soda Core:**
    ```bash
    pip install soda-core
    ```
    Or, for a specific warehouse (e.g., PostgreSQL):
    ```bash
    pip install soda-core-postgres
    ```

## Configuration

- Edit `checks/soda/configuration.yml` to add your database connection details.
- Edit `checks/soda/checks.yml` to define your data quality checks.

## How to Run Soda Scan

Run a scan using your configuration and checks file:

```bash
soda scan -d <data_source_name> -c checks/soda/configuration.yml checks/soda/checks.yml
```

Replace `<data_source_name>` with the name defined in your `configuration.yml`, e.g., `customer_shopping`.

Example:
```bash
soda scan -d customer_shopping -c checks/soda/configuration.yml checks/soda/checks.yml
```

## How to Generate a Report

To save the scan output to a text file:
```bash
soda scan -d customer_shopping -c checks/soda/configuration.yml checks/soda/checks.yml > soda_report.txt
```

## Example Custom Checks

```yaml
- min_age between 0 and 150:
    min_age query: |
        SELECT MIN(CAST(age AS INTEGER)) AS min_age FROM customer_shopping
- min_quantity between 1 and 100:
    min_quantity query: |
        SELECT MIN(CAST(quantity AS INTEGER)) AS min_quantity FROM customer_shopping
- val_price between 0 and 100000:
    val_price query: |
        SELECT CAST(price AS numeric) AS val_price FROM customer_shopping
```

## Troubleshooting

- Ensure your database columns are cast correctly in custom queries.
- Soda Core only supports single-value results in custom queries.
- For advanced reporting or integrations, consider [Soda Cloud](https://cloud.soda.io/).

## Resources

- [Soda Core Documentation](https://docs.soda.io/soda-core/)
- [SodaCL Reference](https://docs.soda.io/sodacl/)
