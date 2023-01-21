-- GROUP C : Aiman Mukhtar,Muhammad Waleed Yasin , Osama Yusuf Hassan , Umair Khalid , Ghazi Haider

-- 1.find out which mode of submission is used most.
SELECT Submitted_via,COUNT(*) AS value_occurrence 
FROM project01.consumerdata01
GROUP BY Submitted_via
ORDER BY value_occurrence DESC
LIMIT 1;

-- 2.Which product was most popular in a specific month of particular year
SELECT  Product_Name, count(Product_Name) AS value_occurrence
FROM project01.consumerdata01
WHERE monthname(Date_Received) = 'July'
AND year(Date_Received) = '2013'
GROUP BY Product_Name
ORDER BY value_occurrence DESC
LIMIT 1; 

-- 3.Most complaints on products in each year.
SELECT Product_Name , count(Product_Name) AS no_of_complaints
FROM project01.consumerdata01
WHERE year(Date_Received) = '2013'
GROUP BY Product_Name
ORDER BY no_of_complaints DESC;

-- 4.Identifying the key issues , which issue comes the most 
SELECT Issue, COUNT(Issue) AS value_occurrence
FROM project01.consumerdata01
WHERE year(Date_Received) = '2014'
GROUP BY Issue
HAVING value_occurrence > 1000
ORDER BY value_occurrence DESC;  

-- 5.Which state has a high complaints on products?
SELECT State_Name, Product_Name , 
count(State_Name) AS no_of_complaints
FROM project01.consumerdata01
GROUP BY State_Name, Product_Name
ORDER BY no_of_complaints DESC;  

-- 6.How many days does it take to forward a complaint?
SELECT Complaint_ID , datediff(Date_Sent_to_Company , Date_Received) AS No_of_Days
FROM project01.consumerdata01
ORDER BY No_of_Days DESC
LIMIT 5;

-- 7.Timely Response rate: check the response rate that will tell the performance of department.
SELECT sum(CASE WHEN Timely_Response = 'Yes' THEN 1 ELSE 0 END)
	/count(*) AS Timely_response_rate
FROM project01.consumerdata01;


-- 8.Consumer Complaints Dispute rate : check consumer disputed rate and if it's high then needs to work on customer care.
SELECT sum(CASE WHEN Consumer_Disputed = 'Yes' THEN 1 ELSE 0 END)
	/count(Consumer_Disputed) AS Dispute_Rate
FROM project01.consumerdata01;

-- 9.Consumer Complaints resolution rate .
SELECT sum(CASE WHEN Consumer_Disputed = 'No' THEN 1 ELSE 0 END)
	/count(Consumer_Disputed) AS Resolution_Rate
FROM project01.consumerdata01;

-- 10.Which company is most responsive?
SELECT DISTINCT Company , COUNT(Timely_Response) AS value_occurrence
FROM project01.consumerdata01
WHERE Timely_Response = 'Yes'
GROUP BY Company
ORDER BY value_occurrence DESC
LIMIT 5;

-- 11.Which Company has the most complaints?
SELECT Company , COUNT(*) AS no_of_complaints
FROM project01.consumerdata01
GROUP BY Company
ORDER BY no_of_complaints DESC
LIMIT 5;

-- 12.What are the products with the most number of complaints?
SELECT Product_Name , Count(Product_Name) AS No_of_Complaints
FROM project01.consumerdata01
GROUP BY Product_Name
ORDER BY No_of_complaints DESC
LIMIT 5;

-- 13.What are the products with the most number of disputes?
SELECT Product_Name , 
sum(case when Consumer_Disputed = 'Yes' then 1 else 0 end) AS No_of_disputes
FROM project01.consumerdata01
GROUP BY Product_Name
ORDER BY No_of_disputes DESC
LIMIT 5	;

-- 14.How does the company respond to the complaints?
SELECT Company , Count(Company_Response_to_Consumer) AS value_occurrence
FROM project01.consumerdata01
WHERE Company_Response_to_Consumer LIKE 'Closed with non%'
GROUP BY Company
ORDER BY value_occurrence DESC;

-- 15.consumer complaint success rate by product.
SELECT Product_Name, 
sum(case When Consumer_Disputed = 'No' then 1 Else 0 end )/Count(Consumer_Disputed)  AS Success_Rate 
FROM project01.consumerdata01
GROUP BY Product_Name
ORDER BY Success_Rate DESC;


