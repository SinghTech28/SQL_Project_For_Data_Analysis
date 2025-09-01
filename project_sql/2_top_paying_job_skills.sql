WITH top_paying_job_skills AS (
    SELECT 
        skill_id,
        job_id
    FROM skills_job_dim
    WHERE job_id IN(
        SELECT 
            job_id
        FROM job_postings_fact
        WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst'
        LIMIT 100
    )
)

SELECT 
    COUNT(top_paying_job_skills.skill_id) AS skill_count,
    skills.skills
FROM top_paying_job_skills
INNER JOIN skills_dim AS skills 
    ON top_paying_job_skills.skill_id = skills.skill_id
GROUP BY skills.skills
ORDER BY skill_count DESC;    