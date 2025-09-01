SELECT
    COUNT(job_id) as total_jobs,
    ROUND(AVG(salary_year_avg)) as avg_salary,
    MAX(salary_year_avg) as max_salary
FROM
    job_postings_fact 
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id       
WHERE 
    job_title_short LIKE '%Data Analyst' OR job_title_short = 'Data Analyst'




