Here is a structured `README.md` file tailored for your project. You can copy this content directly into a new file named `README.md` in your repository.

---

# World Cup Database Project

This project is part of the **freeCodeCamp Relational Database Certification**. The goal was to build a database to store historical World Cup data and create scripts to insert and query that data using SQL and Bash.

## Table of Contents

* [Project Overview](https://www.google.com/search?q=%23project-overview)
* [Files Included](https://www.google.com/search?q=%23files-included)
* [How to Run](https://www.google.com/search?q=%23how-to-run)
* [Skills Learned](https://www.google.com/search?q=%23skills-learned)

## Project Overview

The project involves taking a dataset of World Cup game results (in CSV format) and:

1. Designing a normalized relational database schema.
2. Creating bash scripts to automate the insertion of data into the database.
3. Writing complex SQL queries to extract specific insights from the database.

## Files Included

* `games.csv`: The source dataset containing year, round, winner, opponent, and score information.
* `insert_data.sh`: A Bash script that reads `games.csv` and populates the PostgreSQL database.
* `queries.sh`: A Bash script that runs various SQL queries to answer questions about the data.
* `worldcup.sql`: A dump of the database schema and data.

## How to Run

To run this project, ensure you have a PostgreSQL environment set up.

1. **Create the Database:**
```bash
psql --username=freecodecamp --dbname=postgres
CREATE DATABASE worldcup;

```


2. **Run the Insertion Script:**
Make sure the script is executable and run it to populate your tables:
```bash
chmod +x insert_data.sh
./insert_data.sh

```


3. **Run Queries:**
Use the query script to verify the data:
```bash
chmod +x queries.sh
./queries.sh

```



## Skills Learned

* PostgreSQL database design and normalization.
* Writing Bash scripts to interact with a database via `psql`.
* Constructing complex SQL queries using `JOIN`, `GROUP BY`, `ORDER BY`, and subqueries.
* Handling CSV parsing using shell commands.

---

*Note: You may want to add a screenshot of your database schema (ER diagram) to the "Project Overview" section to make it more professional!*
