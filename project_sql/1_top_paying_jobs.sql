/*
**Question: What are the top-paying data analyst jobs?**

- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
    job_id,
    c.name AS company_name,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date

FROM
    job_postings_fact AS j
LEFT JOIN company_dim AS c
    ON j.company_id = c.company_id
WHERE
        job_work_from_home IS TRUE
    AND
        salary_year_avg > 120000
    AND
        job_title_short ILIKE 'Data Analyst'
ORDER BY
    salary_year_avg DESC
LIMIT 10
