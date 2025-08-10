# Data Quality Checks on Customer Shopping Data

This repository demonstrates how to perform data quality (DQ) checks on a sample CSV dataset (`customer_shopping_data.csv`) using various leading open-source data validation frameworks. The goal is to compare the capabilities, workflows, and results of each tool when applied to the same dataset.

## Repository Structure

```
.
├── checks
│   ├── dbt_expectations
│   │   ├── dbt_packages
│   │   │   ├── dbt_date
│   │   │   ├── dbt_expectations
│   │   │   └── dbt_utils
│   │   ├── dbt_project.yml
│   │   ├── logs
│   │   │   └── dbt.log
│   │   ├── models
│   │   │   ├── customer_shopping.sql
│   │   │   └── customer_shopping.yml
│   │   ├── package-lock.yml
│   │   ├── packages.yml
│   │   ├── README.md
│   │   └── target
│   │       ├── compiled
│   │       ├── graph.gpickle
│   │       ├── graph_summary.json
│   │       ├── manifest.json
│   │       ├── partial_parse.msgpack
│   │       ├── run
│   │       ├── run_results.json
│   │       └── semantic_manifest.json
│   ├── deequ
│   ├── great_expectations
│   └── soda
├── data
│   └── customer_shopping_data.csv
├── dq-env310
│   ├── bin
│   ├── include
│   ├── lib
│   ├── lib64
│   └── pyvenv.cfg
├── LICENSE
└── results
```

- **checks/**: Contains subfolders for each DQ tool implementation.
    - **dbt_expectations/**: Implementation using dbt-expectations (currently complete).
    - **great_expectations/**: Placeholder for future Great Expectations setup.
    - **deequ/**: Placeholder for future Deequ setup.
    - **soda/**: Placeholder for future Soda SQL setup.
- **data/**: Contains the raw CSV file to be validated.
- **dq-env310/**: Python virtual environment and dependencies.
- **results/**: Intended for storing validation results and reports.
- **LICENSE**: Repository license.

## Current Status

- **Implemented:**  
  - Data quality checks using [dbt-expectations](https://github.com/metaplane/dbt-expectations) on the customer shopping data CSV.
- **Planned:**  
  - Equivalent checks using [Great Expectations](https://greatexpectations.io/), [Soda SQL](https://soda.io/), and [Deequ](https://github.com/awslabs/deequ).

## Getting Started

1. **Clone this repository:**
    ```bash
    git clone <repo_url>
    cd <repo_folder>
    ```

2. **Set up the Python environment:**
    ```bash
    source dq-env310/bin/activate
    ```

3. **Run dbt-expectations checks:**
    ```bash
    cd checks/dbt_expectations
    dbt test
    ```
    Results can be found in the `target/` directory and log files.

4. **Add your implementations:**  
   Follow the examples in `checks/dbt_expectations/` to implement DQ checks using other tools.

## Insights

### Differences Between Great Expectations and dbt-expectations

| Feature                  | dbt-expectations           | Great Expectations          |
|--------------------------|----------------------------|----------------------------|
| **Supported Sources**    | SQL databases only         | SQL, files, DataFrames     |
| **Custom logic**         | SQL only                   | Python, SQL, files         |
| **Integration**          | dbt only                   | Any Python workflow        |
| **Reporting**            | dbt logs                   | HTML Data Docs, APIs       |
| **Interactivity**        | No                         | Yes (Data Docs, Notebooks) |
| **Expectation Depth**    | Subset (SQL only)          | Full library               |

- **dbt-expectations** is ideal for SQL-centric analytics engineering, seamlessly integrating with dbt models and workflows. However, it is limited to data sources accessible via SQL.
- **Great Expectations** offers broader support for files, Python data structures, interactive docs, and flexible custom expectations, making it suitable for a wider range of validation scenarios, including local files and non-SQL sources.

## Future Work

- Implement and compare DQ checks using Great Expectations, Soda SQL, and Deequ.
- Add benchmark results and insights for each tool.
- Summarize best practices and recommendations for choosing a DQ tool based on project needs.

---

**Contributions and suggestions are welcome!**
