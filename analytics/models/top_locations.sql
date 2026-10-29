select 
    job_location,
    count(*) as postings
from {{ ref('job_postings') }}
group by job_location
order by postings desc
limit 10

-- If dev.duckdb is removed, then when this top_locations is run then it will throw error as it depends on the model created by job_postings 
-- To sustain the run and make sure that it completes , we can add a '+' sign infront of the command that would mean that first create all the necessary models required to run this particular model

-- Simple command : dbt run --select top_locations --> this will through error
-- Simple fix command : dbt run --select +top_locations --> This will run without error. It'll first build the top model then the ones that depends on it.

-- dbt run --select top_locations+ will make everything that needs that particular model