/* 
Questions: What are the most in-demand skills for data analysts ?
- Join job posting to inner join table similar to query 2 
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings 
- Why? Retrieves the top 5 skills with the highest demand in the job market
*/

Select job_postings_fact.*
From job_postings_fact
Inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
Inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
Limit 5