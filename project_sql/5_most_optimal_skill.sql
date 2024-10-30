/*
**Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill) for a data analyst?** 

- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), offering strategic insights for career development in data analysis
*/

WITH skills AS(
    SELECT
        s.skill_id,
        s.skills,
        COUNT(s.skills) AS skill_count
    FROM
        job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj
        ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS s
        on sj.skill_id = s.skill_id
    WHERE
            job_title_short ILIKE 'Data Analyst'
        AND
            salary_year_avg > 120000    
        AND
            job_work_from_home IS TRUE
    GROUP BY
        s.skill_id
),
avg_skill_pay AS(
    SELECT
        s.skill_id,
        ROUND(avg(salary_year_avg),0) AS avg_yearly_salary
    FROM
        job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj
        ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS s
        on sj.skill_id = s.skill_id
    WHERE
            job_title_short ILIKE 'Data Analyst'
        AND
            salary_year_avg > 120000    
        AND
            job_work_from_home IS TRUE
    GROUP BY
        s.skill_id,
        s.skills

)

SELECT
    s.skills,
    s.skill_count,
    p.avg_yearly_salary
FROM skills AS s
LEFT JOIN avg_skill_pay AS p
    ON s.skill_id = p.skill_id
WHERE
    s.skill_count > 10
ORDER BY
    p.avg_yearly_salary DESC


--More Efficient Code

SELECT 
    skills_dim.skills, 
    COUNT(skills_job_dim.job_id) AS demand_count, 
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg > 120000
    AND job_work_from_home = True
GROUP BY 
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    avg_salary DESC, 
    demand_count DESC
LIMIT 25;
