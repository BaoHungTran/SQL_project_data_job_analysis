/*
Questions:
1. What are the top paying data analysis job ?
    - Identify the top 10 highest paying data analysis role that are available remotely
    - Focuses on job postings with specified salaries (remove null)
    - Why ? Highlight the top paying opportunities for Data Analysts, offering insights
*/

SELECT
    company_dim.name as company_name,
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
From job_postings_fact
Left join company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE  
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' And
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
Limit 10