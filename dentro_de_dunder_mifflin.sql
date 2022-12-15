/*

Crear una tabla que muestre la región para cada representante de venta, junto con sus cuentas asociadas.

Incluir sólo la región de 'Midwest'. 
La tabla final debe incluir tres columnas: 
La región, el representante de ventas y La cuenta. 

Ordenar alfabéticamente, según el nombre de la cuenta.

*/

SELECT 
    public.region.name AS region,   
    public.sales_reps.name AS rep_venta,
    public.accounts.name AS cuenta
FROM public.sales_reps
INNER JOIN public.region
ON public.sales_reps.region_id = public.region.id
INNER JOIN public.accounts
ON public.sales_reps.id = public.accounts.sales_rep_id
WHERE public.sales_reps.region_id = 2
ORDER BY cuenta;

/*

Crear una tabla que muestre la región para cada representante de venta, junto con sus cuentas asociadas.
Incluir sólo a representantes de ventas, cuyo nombre comience con la letra 'S' en la región de 'Midwest'.

La tabla final debe incluir tres columnas: 
La región, el representante de ventas y La cuenta.

Ordene alfabéticamente, según el nombre de la cuenta.

*/

SELECT 
    public.region.name AS region,   
    public.sales_reps.name AS rep_venta,
    public.accounts.name AS cuenta
FROM public.sales_reps
INNER JOIN public.region
ON public.sales_reps.region_id = public.region.id
INNER JOIN public.accounts
ON public.sales_reps.id = public.accounts.sales_rep_id
WHERE public.sales_reps.region_id = 2
    AND public.sales_reps.name LIKE 'S%'
ORDER BY cuenta;

/*

Crear una tabla que muestre la región para cada representante de venta, junto con sus cuentas asociadas.

Incluir sólo a representantes de ventas, cuyo nombre comience con la letra 'K' en la región de 'Midwest'.

La tabla final debe incluir tres columnas: 
La región, el representante de ventas y La cuenta.
Ordene alfabéticamente, según el nombre de la cuenta.

*/

SELECT 
    public.region.name AS region,   
    public.sales_reps.name AS rep_venta,
    public.accounts.name AS cuenta
FROM public.sales_reps
INNER JOIN public.region
ON public.sales_reps.region_id = public.region.id
INNER JOIN public.accounts
ON public.sales_reps.id = public.accounts.sales_rep_id
WHERE public.sales_reps.region_id = 2
    AND public.sales_reps.name LIKE 'K%'
ORDER BY cuenta;

/*

Para cada cuenta, determine la cantidad promedio para cada tipo de papel, que compraron en todos sus pedidos. 

La tabla debe contener cuatro columnas: 
El nombre de la cuenta y una que promedie la cantidad total de cada tipo de papel para cada cuenta.

*/

SELECT
    public.accounts.name AS cuenta,
    ROUND(AVG(public.orders.standard_amt_usd), 2) AS media_standard,
    ROUND(AVG(public.orders.gloss_amt_usd), 2) AS media_gloss,
    ROUND(AVG(public.orders.poster_amt_usd), 2) AS media_poster    
FROM public.orders
INNER JOIN public.accounts
ON public.orders.account_id = public.accounts.id
GROUP BY cuenta;

/*

Crear una tabla que muestre el número de veces que se utilizó un canal determinado, para cada representante de ventas.

La tabla final debe tener tres columnas: 
El representante de ventas, el canal y el número de ocurrencias por canal. 

Ordenar de manera ascendente.

*/

SELECT
    public.sales_reps.name AS rep_venta,
    public.web_events.channel AS canal_venta,
    COUNT(public.web_events.channel) AS conteo_canal
FROM public.sales_reps
INNER JOIN public.accounts
ON public.accounts.sales_rep_id = public.sales_reps.id
LEFT JOIN public.web_events
ON public.accounts.id = public.web_events.account_id
GROUP BY public.sales_reps.name, public.web_events.channel
ORDER BY conteo_canal DESC;
