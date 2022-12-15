/*

Provide a table that provides the region for each sales_rep along with their associated accounts.
This time only for the Midwest region. Your final table should include three columns: the region name,
the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

*/

SELECT 
    public.region.name AS region,   
    public.sales_reps.name AS sales_rep,
    public.accounts.name AS account_name
FROM public.sales_reps
INNER JOIN public.region
ON public.sales_reps.region_id = public.region.id
INNER JOIN public.accounts
ON public.sales_reps.id = public.accounts.sales_rep_id
WHERE public.sales_reps.region_id = 2
ORDER BY account_name

/*

Provide a table that provides the region for each sales_rep along with their associated accounts.
This time only for accounts where the sales rep has a first name starting with S and in the Midwest region.
Your final table should include three columns: the region name, the sales rep name, and the account name.
Sort the accounts alphabetically (A-Z) according to account name.

*/

SELECT 
    public.region.name AS region,   
    public.sales_reps.name AS sales_rep,
    public.accounts.name AS account_name
FROM public.sales_reps
INNER JOIN public.region
ON public.sales_reps.region_id = public.region.id
INNER JOIN public.accounts
ON public.sales_reps.id = public.accounts.sales_rep_id
WHERE public.sales_reps.region_id = 2
    AND public.sales_reps.name LIKE 'S%'
ORDER BY account_name

/*

Provide a table that provides the region for each sales_rep along with their associated accounts.
This time only for accounts where the sales rep has a last name starting with K and in the Midwest region.
Your final table should include three columns: the region name, the sales rep name, and the account name.
Sort the accounts alphabetically (A-Z) according to account name.

*/

SELECT 
    public.region.name AS region,   
    public.sales_reps.name AS sales_rep,
    public.accounts.name AS account_name
FROM public.sales_reps
INNER JOIN public.region
ON public.sales_reps.region_id = public.region.id
INNER JOIN public.accounts
ON public.sales_reps.id = public.accounts.sales_rep_id
WHERE public.sales_reps.region_id = 2
    AND public.sales_reps.name LIKE 'K%'
ORDER BY account_name;

/*

For each account, determine the average amount of each type of paper they purchased across their orders. 
Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types 
for each account.
*/

SELECT
    public.accounts.name AS account,
    ROUND(AVG(public.orders.standard_amt_usd), 2) AS standard_avg,
    ROUND(AVG(public.orders.gloss_amt_usd), 2) AS standard_avg,
    ROUND(AVG(public.orders.poster_amt_usd), 2) AS standard_avg    
FROM public.orders
INNER JOIN public.accounts
ON public.orders.account_id = public.accounts.id
GROUP BY account;

/*

Determine the number of times a particular channel was used in the web_events table for each sales rep. 
Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. 
Order your table with the highest number of occurrences first.

*/
SELECT
    public.sales_reps.name AS sales_rep,
    public.web_events.channel AS channel,
    COUNT(public.web_events.channel) AS channel_count
FROM public.sales_reps
INNER JOIN public.accounts
ON public.accounts.sales_rep_id = public.sales_reps.id
LEFT JOIN public.web_events
ON public.accounts.id = public.web_events.account_id
GROUP BY public.sales_reps.name, public.web_events.channel
ORDER BY channel_count DESC;
