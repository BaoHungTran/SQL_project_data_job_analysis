/* 
Questions:
2. What skills are required for the top paying data analyst jobs?
    - Use the top 10 highest paying Data Analyst jobs from first query 
    - Add the specific skills required for these roles 
    - Why ? It provides a detailed look at which high paying jobs demand certain skills.
*/
With top_paying_jobs as
(
    SELECT
        name as company_name,
        job_title,
        job_id,
        salary_year_avg
    From job_postings_fact
    Left join company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE  
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' And
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    Limit 10
)

Select 
    top_paying_jobs.*,
    skills
From top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
Order by salary_year_avg DESC