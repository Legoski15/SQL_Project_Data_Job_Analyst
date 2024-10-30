/*
**Question: What are the most in-demand skills for data analysts?**

- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/

SELECT
    s.skills,
    COUNT(s.skills) AS skill_count
FROM
    job_postings_fact AS j
LEFT JOIN skills_job_dim AS sj
    ON j.job_id = sj.job_id
LEFT JOIN skills_dim AS s
    on sj.skill_id = s.skill_id
WHERE
        job_title_short ILIKE 'Data Analyst'
    AND
        salary_year_avg > 100000    
    AND
        job_work_from_home IS TRUE
GROUP BY
    s.skills
ORDER BY
    skill_count DESC
LIMIT 25