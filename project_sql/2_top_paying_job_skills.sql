/*
 Question: what skills are required for the top-paying data analyst jobs?
 */
with top_paying_jobs as (
    SELECT job_id,
        job_title,
        salary_year_avg,
        name as company_name
    FROM job_postings_fact as job_post
        left join company_dim on job_post.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg is not NULL
    order by salary_year_avg desc
    limit 10
)
SELECT top_paying_jobs.*,
    skills
from top_paying_jobs
    INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
    /*
     here's the breakdown:
     SQL is leading with a count of 8.
     Python follows with count of 7.
     Tableau is highly sought after, with a count of 6.
     */