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
│   │   └── gx
│   │       ├── checkpoints
│   │       ├── expectations
│   │       ├── great_expectations.yml
│   │       ├── plugins
│   │       ├── profilers
│   │       └── uncommitted
│   └── soda
│       ├── checks.yml
│       ├── configuration.yml
│       ├── README.md
│       └── soda_report.txt
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
    - **soda/**: Implemented
- **data/**: Contains the raw CSV file to be validated.
- **dq-env310/**: Python virtual environment and dependencies.
- **results/**: Intended for storing validation results and reports.
- **LICENSE**: Repository license.

## Current Status

- **Implemented:**  
  - Data quality checks using [dbt-expectations](https://github.com/metaplane/dbt-expectations) on the customer shopping data CSV, [Great Expectations](https://greatexpectations.io/), [Soda SQL](https://soda.io/)
- **Planned:**  
  - Equivalent checks using [Deequ](https://github.com/awslabs/deequ).

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

Readme files are placed in respective folders for individual setups

## Insights

### Differences: Soda Core vs Great Expectations vs DBT

| Feature                  | Soda Core                                 | Great Expectations                | DBT (with tests)                      |
|--------------------------|-------------------------------------------|-----------------------------------|---------------------------------------|
| **Setup**                | YAML config, CLI, custom SQL metrics      | Python, CLI, config files, Python | SQL/YAML, integrates with db          |
| **Type Conversion**      | Custom query with casting in checks file  | Python logic, expectation suites  | SQL test logic, schema.yml constraints|
| **Error Reporting**      | CLI output, Soda Cloud dashboard (pro)    | HTML, JSON, CLI, DataDocs         | CLI output, artifacts, docs           |
| **Test Granularity**     | Row-level, column-level, aggregate        | Row, column, table, custom logic  | Column, table, custom macros          |
| **Custom SQL Checks**    | Yes, via query block in YAML              | Yes, via custom expectations      | Yes, via SQL tests                    |
| **Output Format**        | CLI text, Soda Cloud (pro)                | HTML, JSON, Markdown, CLI         | CLI, artifacts, docs                  |
| **Ease of Use**          | Simple YAML, CLI, flexible queries        | More Pythonic, rich ecosystem     | SQL-focused, integrates with modeling |
| **Automated Docs**       | Soda Cloud (pro)                          | DataDocs                          | dbt docs                              |

### Summary

- **Soda Core**: Lightweight, YAML-driven, flexible for custom SQL validation, and quick to integrate with CI/CD.
- **Great Expectations**: Python-centric, rich validations and documentation, suited for data science and analytics teams.
- **DBT**: SQL-centric, best for data engineering/modeling, integrates tests with transformations and documentation.


## Future Work

- Implement and compare DQ checks using Great Expectations, Soda SQL, and Deequ.
- Add benchmark results and insights for each tool.
- Summarize best practices and recommendations for choosing a DQ tool based on project needs.

---
## References

- [Soda Core Documentation](https://docs.soda.io/soda-core/)
- [Great Expectations Documentation](https://docs.greatexpectations.io/docs/)
- [DBT Documentation](https://docs.getdbt.com/docs/introduction)

---

*Maintained by [@sneha-dq](https://github.com/sneha-dq)*

**Contributions and suggestions are welcome!**
