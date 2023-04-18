-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon

-- SELECT * FROM final_airbnb;



-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out how many rows are in the table "final_airbnb"
-- EXPECTED OUTPUT: 146
-- SELECT count(id) FROM final_airbnb;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out the name of the host for "host_id" 63613
-- HINT: "Where" could it be?

-- SELECT host_name FROM final_airbnb WHERE host_id = 63613;
-- 

-- EXPECTED OUTPUT: Patricia


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to just show the unique neighbourhoods listed
-- HINT: This is a "distinct" operation...

-- SELECT DISTINCT neighbourhood FROM final_airbnb;
-- EXPECTED OUTPUT: 40 neighbourhoods listed


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>

-- Find both the highest price listing and the lowest price listing, displaying the entire row for each
-- HINT: This can be two different queries.
-- SELECT MIN(price), MAX(price) FROM final_airbnb;

-- SELECT DISTINCT * FROM final_airbnb AS a, 


-- FOOD FOR THOUGHT: Think about the results. Are the high and low prices outliers in this data set?

-- EXPECTED OUTPUT: Highest = 785, Lowest = 55


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the average availability for all listings in the data set (using the availability_365 column)
-- HINT: Aggregates are more than just big rocks...

-- EXPECTED OUTPUT: 165.3904
-- SELECT AVG(availability_365) FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Find all listings that do NOT have a review
-- HINT: There are a few ways to go about this. Remember that an empty cell is "no value", but not necessarily NULL

-- SELECT * FROM final_airbnb
-- WHERE last_review = '';

-- EXPECTED OUTPUT: 6 rows


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 
-- HINT: Sorting is your friend!

-- SELECT id, room_type, number_of_reviews FROM final_airbnb 
-- WHERE room_type = "Private room"
-- ORDER BY number_of_reviews DESC
-- LIMIT 1;

-- EXPECTED OUTPUT: 58059


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the most popular neighbourhood for listings 
-- HINT: Look for which neighbourhood appears most frequently in the neighbourhood column
-- HINT: You are creating "summary rows" for each neighbourhood, so you will just see one entry for each neighbourhood

-- SELECT neighbourhood FROM final_airbnb
-- GROUP BY neighbourhood
-- ORDER BY COUNT(neighbourhood) DESC
-- LIMIT 1;



-- EXPECTED OUTPUT: Williamsburg
-- INVESTIGATE: Should Williamsburg be crowned the most popular neighbourhood?

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with 
-- a minimum_nights value of less than 7
-- HINT: Sorting is still your friend! So are constraints.

-- SELECT id FROM final_airbnb
-- WHERE minimum_nights< 7
-- ORDER BY reviews_per_month DESC
-- LIMIT 1;
-- EXPECTED OUTPUT: 58059


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out which host has the most listings. 
-- Create a NEW column that will show a calculation for how many listings the host for each listing has in the table
-- Display the column using aliasing.
-- HINT: Work this one step at a time. See if you can find a way to just display the count of listings per host first.

-- SELECT host_name, COUNT(host_name) AS Number_of_Listings FROM final_airbnb
-- GROUP BY host_name
-- ORDER BY COUNT(host_name) DESC
-- LIMIT 1;

-- EXPECTED OUTPUT: The Box House Hotel with 6 listings


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 11 >>>>>>>>>>>>>>>>>>>>>>>
-- <<<<<<<<<<<<<<<<<<<<<<< WRAP UP >>>>>>>>>>>>>>>>>>>>>>>>>
-- What do you think makes a successful AirBnB rental in this market? What factors seem to be at play the most?
-- Write a few sentences and include them with your project submission in the README file 


-- <<<<<<<<<<<<<<<<<<<<< ** BONUS ** >>>>>>>>>>>>>>>>>>>>>>>
-- Find the the percent above or below each listing is compared to the average price for all listings.
-- HINT: No hints! It's a bonus for a reason :)



SELECT t.host_id, t.host_name, t.price, ROUND((t.price - a.average)/a.average * 100,0) AS Perc_Diff_from_Average_Price
FROM final_airbnb t
JOIN
(SELECT AVG(price) AS average
FROM final_airbnb) a
;

--  ADDING A LINE TO SEE IF GITHUB HAS UPDATED VERSION --