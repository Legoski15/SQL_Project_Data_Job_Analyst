/*
**Answer: What are the top skills based on salary?** 

- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.
*/


SELECT
    s.skills,
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
    s.skills
ORDER BY
    avg_yearly_salary DESC


/*
The top 25 paying skills for data analysts in remote jobs reflect a strong emphasis on technical expertise, particularly in big data, cloud computing, and data engineering tools. High salaries are associated with advanced data processing libraries, cloud platforms, and version control tools, while business intelligence and collaboration tools also play a significant role in shaping the high-paying job market.

Key Insights:
Big Data and Cloud Expertise: Skills in platforms like PySpark, AWS, and Azure command top salaries, showing that cloud and big data competencies are crucial for high-paying remote data analyst roles.
Data Manipulation and Engineering: Tools such as Pandas, Numpy, and Hadoop highlight the demand for data science and engineering skills, essential for handling large datasets.
Collaboration and Project Tools: Tools like GitLab, Jira, and Confluence indicate that collaboration, version control, and project management are critical skills in remote work environments.
These trends show that employers value technical skills paired with strong collaborative abilities in remote settings.

[
  {
    "skills": "pyspark",
    "avg_yearly_salary": "208172"
  },
  {
    "skills": "gitlab",
    "avg_yearly_salary": "195500"
  },
  {
    "skills": "jupyter",
    "avg_yearly_salary": "190415"
  },
  {
    "skills": "crystal",
    "avg_yearly_salary": "190250"
  },
  {
    "skills": "sap",
    "avg_yearly_salary": "189309"
  },
  {
    "skills": "jenkins",
    "avg_yearly_salary": "189309"
  },
  {
    "skills": "bitbucket",
    "avg_yearly_salary": "189155"
  },
  {
    "skills": "atlassian",
    "avg_yearly_salary": "189155"
  },
  {
    "skills": "pandas",
    "avg_yearly_salary": "181138"
  },
  {
    "skills": "numpy",
    "avg_yearly_salary": "173667"
  },
  {
    "skills": "powerpoint",
    "avg_yearly_salary": "172443"
  },
  {
    "skills": "azure",
    "avg_yearly_salary": "171707"
  },
  {
    "skills": "confluence",
    "avg_yearly_salary": "166936"
  },
  {
    "skills": "oracle",
    "avg_yearly_salary": "166152"
  },
  {
    "skills": "databricks",
    "avg_yearly_salary": "165594"
  },
  {
    "skills": "matlab",
    "avg_yearly_salary": "165000"
  },
  {
    "skills": "mysql",
    "avg_yearly_salary": "162758"
  },
  {
    "skills": "couchbase",
    "avg_yearly_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_yearly_salary": "160515"
  },
  {
    "skills": "cognos",
    "avg_yearly_salary": "160515"
  },
  {
    "skills": "linux",
    "avg_yearly_salary": "160515"
  },
  {
    "skills": "hadoop",
    "avg_yearly_salary": "159605"
  },
  {
    "skills": "git",
    "avg_yearly_salary": "159500"
  },
  {
    "skills": "aws",
    "avg_yearly_salary": "158239"
  },
  {
    "skills": "jira",
    "avg_yearly_salary": "157702"
  }
]

*/