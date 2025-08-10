# dbt-expectations Implementation for Customer Shopping Data

## Overview

This project demonstrates how to implement data quality checks on a CSV dataset (`customer_shopping.csv`) using `dbt` with the `dbt-utils` and `dbt-expectations` packages.

---

## Steps Taken

### 1. Setup Environment

- Created a Python virtual environment and installed dbt (version 1.10.7).
- Configured the `profiles.yml` to connect to the target database (Postgres in this case).
- Created a dbt project named `dq_tools_comparison`.

### 2. Installed Required Packages

- Added the `dbt_utils` package to `packages.yml`.
- Added the `metaplane/dbt_expectations` package (the updated maintained package) to `packages.yml`.
- Ran `dbt deps` to install these packages and their dependencies.

### 3. Model and Source Setup

- Placed the source CSV data into a table/view named `customer_shopping`.
- Created a model in `models/customer_shopping.sql` (if applicable).
- Created `models/customer_shopping.yml` to define tests on the model columns.

### 4. Defined Data Tests in YAML

- Defined `not_null` and `unique` tests for key columns (`customer_id`, `invoice_no`).
- Added `accepted_values` test for `payment_method`.
- Added custom expression tests using `dbt_utils.expression_is_true` for `price` and `quantity`, with type casting to numeric:

  ```yaml
  - name: price
    tests:
      - not_null
      - dbt_utils.expression_is_true:
          expression: "{{ column_name }}::numeric > 0"

  - name: quantity
    tests:
      - not_null
      - dbt_utils.expression_is_true:
          expression: "{{ column_name }}::numeric > 0"
  ```

### 5. Resolved Compilation and Dependency Issues

- Fixed dependency conflicts with `dbt_utils` versions.
- Updated references to use the new `metaplane/dbt_expectations` package.
- Cleared out stale compiled files in the `target/` directory to avoid old SQL persisting.
- Used correct Jinja templating for expressions inside `dbt_utils.expression_is_true` test.

### 6. Running Tests

- Ran `dbt compile` to validate SQL generation.
- Ran `dbt test` to execute all data quality tests.
- Confirmed tests ran successfully with expected passes/errors.

### 7. (Pending) Store Test Results to a Result Folder

- Planning to configure dbt or custom scripting to store test result logs under a `/result` folder at the project root (not implemented yet).

---

## Notes

- Always clear the `target/` directory to avoid stale compiled SQL.
- Use `{{ column_name }}` inside expressions for dynamic column referencing.
- Make sure the database column data types are compatible or cast appropriately.
- Use the maintained `metaplane/dbt_expectations` package instead of the deprecated one.

---

## How to Run

```bash
dbt deps         # Install packages
dbt compile      # Compile models and tests
dbt test         # Run data quality tests
```

---

## Next Steps

- Implement automated saving of test run results to a `/result` directory.
- Proceed to implement other tools like Soda, Deequ, or Great Expectations for comparison.

---

