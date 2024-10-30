SELECT
    s.skills,
    EXTRACT(YEAR FROM j.job_posted_date) AS year,
    EXTRACT(MONTH FROM j.job_posted_date) AS month,
    COUNT (s.skill_id) as skill_count
FROM
    (
        SELECT *
        FROM january_jobs
    UNION ALL
        SELECT *
        FROM february_jobs
    UNION ALL
        SELECT *
        FROM march_jobs
    ) AS j
LEFT JOIN skills_job_dim as sj
    ON j.job_id = sj.job_id
LEFT JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id
GROUP BY
    s.skills,
    EXTRACT(YEAR FROM j.job_posted_date),
    EXTRACT(MONTH FROM j.job_posted_date)