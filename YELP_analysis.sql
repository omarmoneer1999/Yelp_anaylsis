Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

i. Attribute table =10000
ii. Business table =10000
iii. Category table =10000
iv. Checkin table =10000
v. elite_years table =10000
vi. friend table =10000
vii. hours table =10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table =10000



2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business =none

ii. Hours =Business_id :1562
iii. Category =Business_id:2643
iv. Attribute =Business_id:1115
v. Review =Business_id:8090
            user_id:9581
vi. Checkin = Business_id:493
vii. Photo =Business_id:6493
viii. Tip = Business_id : 3979
            user_id:537
ix. User =  none
x. Friend = user_id : 11
xi. Elite_years = user_id:2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer:NO


	SQL code used to arrive at answer:
      select count(*)
      from user
      where id is null


4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars

		min:1		max:5		avg:3.7082


	ii. Table: Business, Column: Stars

		min:1.0		max:5.0		avg:3.6549


	iii. Table: Tip, Column: Likes

		min:0		max:2		avg: 0.0144


	iv. Table: Checkin, Column: Count

		min:1		max:53		avg:1.9414


	v. Table: User, Column: Review_count

		min:0		max:2000		avg:24.2995



5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
    select city,review_count
      from business
        order by  review_count desc

	Copy and Paste the Result Below:
  +------------+--------------+
  | city       | review_count |
  +------------+--------------+
  | Las Vegas  |         3873 |
  | Montréal   |         1757 |
  | Gilbert    |         1549 |
  | Las Vegas  |         1410 |
  | Las Vegas  |         1389 |
  | Las Vegas  |         1252 |
  | Las Vegas  |         1116 |
  | Las Vegas  |         1084 |
  | Las Vegas  |          961 |
  | Gilbert    |          902 |
  | Las Vegas  |          864 |
  | Scottsdale |          823 |
  | Las Vegas  |          821 |
  | Las Vegas  |          786 |
  | Henderson  |          785 |
  | Toronto    |          778 |
  | Las Vegas  |          768 |
  | Las Vegas  |          758 |
  | Scottsdale |          726 |
  | Cleveland  |          723 |
  | Las Vegas  |          720 |
  | Charlotte  |          715 |
  | Phoenix    |          711 |
  | Las Vegas  |          706 |
  | Phoenix    |          700 |
  +------------+--------------+
  (Output limit exceeded, 25 of 10000 total rows shown)


6. Find the distribution of star ratings to the business in the following cities:

i. Avon: Rating = 4.0           Number = 10

SQL code used to arrive at answer:
  select city,stars,count(stars) as Distribution
    from business
      where city = 'Avon'

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+--------------+
| stars | Distribution |
+-------+--------------+
|   4.0 |           10 |
+-------+--------------+

ii. Beachwood

SQL code used to arrive at answer:
  select stars,count(stars) as Distribution
    from business
      where city ='Beachwood'

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+--------------+
| stars | Distribution |
+-------+--------------+
|   5.0 |           14 |
+-------+--------------+


7. Find the top 3 users based on their total number of reviews:

	SQL code used to arrive at answer:
  SELECT id,
     name,
     review_count
      FROM user
      ORDER BY review_count DESC
      LIMIT 3

	Copy and Paste the Result Below:
  +------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
      Yes, but if we looked at the table we will see that the users when they yelping for
      longer period the reivews count increasing and fans too.

The code:
  SELECT id,
  			   name,
  			   review_count,
  			   fans,
  			   yelping_since
  		FROM user
  		ORDER BY fans DESC


The table:
      +------------------------+-----------+--------------+------+---------------------+
		| id                     | name      | review_count | fans | yelping_since       |
		+------------------------+-----------+--------------+------+---------------------+
		| -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 | 2007-07-19 00:00:00 |
		| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 | 2011-03-30 00:00:00 |
		| -2vR0DIsmQ6WfcSzKWigw  | Harald    |         1153 |  311 | 2012-11-27 00:00:00 |
		| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 | 2012-12-16 00:00:00 |
		| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 | 2009-07-08 00:00:00 |
		| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 | 2009-10-05 00:00:00 |
		| -9bbDysuiWeo2VShFJJtcw | Cat       |          377 |  133 | 2009-02-05 00:00:00 |
		| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 | 2015-02-19 00:00:00 |
		| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 | 2012-04-05 00:00:00 |
		| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 | 2007-08-14 00:00:00 |
		| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 | 2009-05-31 00:00:00 |
		| -DmqnhW4Omr3YhmnigaqHg | Tiffany   |          408 |  111 | 2008-10-28 00:00:00 |
		| -cv9PPT7IHux7XUc9dOpkg | bernice   |          255 |  105 | 2007-08-29 00:00:00 |
		| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 | 2006-03-28 00:00:00 |
		| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 | 2010-10-01 00:00:00 |
		| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 | 2006-07-19 00:00:00 |
		| -4viTt9UC44lWCFJwleMNQ | Ben       |          307 |   96 | 2007-03-10 00:00:00 |
		| -3i9bhfvrM3F1wsC9XIB8g | Linda     |          584 |   89 | 2005-08-07 00:00:00 |
		| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 | 2012-10-08 00:00:00 |
		| -ePh4Prox7ZXnEBNGKyUEA | Jessica   |          220 |   84 | 2009-01-12 00:00:00 |
		| -4BEUkLvHQntN6qPfKJP2w | Greg      |          408 |   81 | 2008-02-16 00:00:00 |
		| -C-l8EHSLXtZZVfUAUhsPA | Nieves    |          178 |   80 | 2013-07-08 00:00:00 |
		| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 | 2009-09-07 00:00:00 |
		| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 | 2008-01-03 00:00:00 |
		| -0zEEaDFIjABtPQni0XlHA | Nicole    |          161 |   73 | 2009-04-30 00:00:00 |
		+------------------------+-----------+--------------+------+---------------------+
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: yes, For love : it had been written for 1780 times
               For hate : it had been written for 232  times


	SQL code used to arrive at answer:
For love:
  SELECT count(text) AS love_times
  FROM review
  where text like "%love%"

For hate:
  SELECT count(text) AS hate_times
  FROM review
  where text like "%hate%"


10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
  SELECT name,
        id,
        fans
	FROM user
	order by fans desc
    limit 10

	Copy and Paste the Result Below:
  +-----------+------------------------+------+
  | name      | id                     | fans |
  +-----------+------------------------+------+
  | Amy       | -9I98YbNQnLdAmcYfb324Q |  503 |
  | Mimi      | -8EnCioUmDygAbsYZmTeRQ |  497 |
  | Harald    | -2vR0DIsmQ6WfcSzKWigw  |  311 |
  | Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |  253 |
  | Christine | -0IiMAZI2SsQ7VmyzJjokQ |  173 |
  | Lisa      | -g3XIcCb2b-BD0QBCcq2Sw |  159 |
  | Cat       | -9bbDysuiWeo2VShFJJtcw |  133 |
  | William   | -FZBTkAZEXoP7CYvRV2ZwQ |  126 |
  | Fran      | -9da1xk7zgnnfO1uTVYGkA |  124 |
  | Lissa     | -lh59ko3dxChBSZ9U7LfUw |  120 |
  +-----------+------------------------+------+



Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

i. Do the two groups you chose to analyze have a different distribution of hours?
  The 4-5 star group seems to have shorter hours then the 2-3 star group

ii. Do the two groups you chose to analyze have a different number of reviews?
  Yes and no, one of the 4-5 star group has a lot more reviews but then the other
    4-5 star group has close to the same number of reviews as the 2-3 star group

iii. Are you able to infer anything from the location data provided between these two groups? Explain.
  No, every business is in a different zip-code.
SQL code used for analysis:
  SELECT B.name,
         B.review_count,
         H.hours,
         postal_code,
         CASE
          WHEN hours LIKE "%monday%" THEN 1
          WHEN hours LIKE "%tuesday%" THEN 2
          WHEN hours LIKE "%wednesday%" THEN 3
          WHEN hours LIKE "%thursday%" THEN 4
          WHEN hours LIKE "%friday%" THEN 5
          WHEN hours LIKE "%saturday%" THEN 6
          WHEN hours LIKE "%sunday%" THEN 7
         END AS ord,
         CASE
          WHEN B.stars BETWEEN 2 AND 3 THEN '2-3 stars'
          WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
         END AS star_rating
    FROM business B
    INNER JOIN hours H
    ON B.id = H.business_id
    INNER JOIN category C
    ON C.business_id = B.id
    WHERE (B.city == 'Las Vegas'
    AND
    C.category LIKE 'shopping')
    AND
    (B.stars BETWEEN 2 AND 3
    OR
    B.stars BETWEEN 4 AND 5)
    GROUP BY stars,ord
    ORDER BY ord,star_rating ASC


2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.

i. Difference 1:
  The business which has a bigger avg review is open

ii. Difference 2:
  In toronto if we looked for the categories of the businesses we will notice that the businesses which related to puplicity will not be open for a long period


SQL code used for analysis:

  select name,category,city,stars,avg(review_count) AS review,is_open
  from business
  join category
  on business.id =category.business_id
  where city = 'Toronto'
  group by name



3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:

i. Indicate the type of analysis you chose to do:
  Predicting whether a business will stay open or close.

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
        To better help businesses understand the importance of different factors which
          will help their business stay open. Some data that may be important; number of
          reviews, star rating of business, hours open, and of course location location
          location. We will gather the latitude and longitude as well as city, state,
          postal_code, and address to make processing easier later on. Categories and
          attributes will be used to better distinguish between different types of
          businesses. `is_open` will determine which business is open and which business
          have closed (not hours) but permanently.

iii. Output of your finished dataset:
+----------------------------------------+--------------+-----------+-------+--------+----------------------+---------+--------+
| name                                   | category     | city      | stars | review | hours                | is_open | stars  |
+----------------------------------------+--------------+-----------+-------+--------+----------------------+---------+--------+
| Big Wong Restaurant                    | Asian Fusion | Las Vegas |   4.0 |  768.0 | Saturday|10:00-23:00 |       1 |      5 |
| Bootleggers Modern American Smokehouse | Barbeque     | Phoenix   |   4.0 |  431.0 | Saturday|11:00-22:00 |       1 |      5 |
| Cafe Tandoor                           | Restaurants  | Aurora    |   3.5 |   32.0 | Saturday|11:30-14:00 |       1 |      4 |
| Slymans Restaurant                     | Restaurants  | Cleveland |   4.5 |  361.0 | Saturday|9:00-13:00  |       1 |      5 |
| West Side Market                       | Meat Shops   | Cleveland |   4.5 |  723.0 | Saturday|7:00-18:00  |       1 |      4 |
+----------------------------------------+--------------+-----------+-------+--------+----------------------+---------+--------+

iv. Provide the SQL code you used to create your final dataset:
  select b.name
  ,category,
  city,
  b.stars,
  avg(b.review_count) AS review,
  hours,
  is_open,
  r.stars
  from business b
  join category c
  on b.id =c.business_id
  join hours h
  on b.id = h.business_id
  join review r
  on b.id = r.business_id
  group by b.name
