--- Credit Card customer Churn Analayis


-- Retrieving all rows and column in the data base

SELECT * FROM `bola-niyo.niyo.final_project_new`;

--- retrieving the number of churned and existing customer

SELECT Attrition_Flag , COUNT(CLIENTNUM) AS numberofcustomer from `bola-niyo.niyo.final_project_new`
GROUP BY Attrition_Flag 
ORDER BY Attrition_Flag;

--- count of customers based on gender and attrition flag . There are more female than male. Also the number of attrited female are more than male

SELECT Gender,Attrition_Flag , COUNT(CLIENTNUM) AS numberofcustomer from `bola-niyo.niyo.final_project_new`
GROUP BY Gender, Attrition_Flag 
ORDER BY Attrition_Flag;

--- count of customers based on Education_Level and attrition flag . Majority of the customers are graduate level

SELECT Education_Level,Attrition_Flag , COUNT(CLIENTNUM) AS numberofcustomer from `bola-niyo.niyo.final_project_new`
GROUP BY Education_Level, Attrition_Flag 
ORDER BY Attrition_Flag;

--- count of customers based on Marital_Status and attrition flag . Majority of the customers are Married and also have a high percentage of singles

SELECT Marital_Status,Attrition_Flag , COUNT(CLIENTNUM) AS numberofcustomer from `bola-niyo.niyo.final_project_new`
GROUP BY Marital_Status, Attrition_Flag 
ORDER BY Attrition_Flag;

--- count of customers based on Dependent_count and attrition flag . Majority of customers have 3 customer dependants

SELECT Dependent_count,Attrition_Flag , COUNT(CLIENTNUM) AS numberofcustomers from `bola-niyo.niyo.final_project_new`
GROUP BY Dependent_count, Attrition_Flag 
ORDER BY Attrition_Flag;

--- count of customers based on Card_Category and attrition flag . Most of the customers have a blue card type

SELECT Card_Category,Attrition_Flag , COUNT(CLIENTNUM) AS numberofclient from `bola-niyo.niyo.final_project_new`
GROUP BY Card_Category, Attrition_Flag 
ORDER BY Attrition_Flag;


--- percentage based Gender

SELECT gender, COUNT(gender) AS totalgender, COUNT(gender) / (SELECT COUNT(gender) FROM bola-niyo.niyo.final_project_new) * 100 AS percentagegender
FROM bola-niyo.niyo.final_project_new
GROUP BY gender;

---- count and percentage of churn and existing customers 

SELECT Attrition_Flag, count(Attrition_Flag) AS churncount, (count(Attrition_Flag) / (SELECT count(Attrition_Flag) FROM bola-niyo.niyo.final_project_new) * 100) AS churnrate
FROM bola-niyo.niyo.final_project_new
GROUP BY Attrition_Flag;


-- ---count and churn rate by Gender. Females customers are more and also has a higher churn rate than men

SELECT 
Gender, sum(Attrition_Flag) AS Churncustomer, round((sum(Attrition_Flag)/COUNT(CLIENTNUM)) *100,2) AS churnrate
FROM bola-niyo.niyo.final_project_new
GROUP BY Gender
ORDER BY Gender ASC;


---Churn count and rate by Income_Category. Customers with £120k+ income has higher churn rate while £60K - £80K has the lowest churn rate

SELECT 
Income_Category, sum(Attrition_Flag) AS Churncustomer, round((sum(Attrition_Flag)/COUNT(CLIENTNUM)) *100,2) AS churnrate
FROM bola-niyo.niyo.final_project_new
GROUP BY Income_Category
ORDER BY Income_Category ASC;

---churn count and rate by Education_Level.  Most customers are greaduate level but the Doctorate levwl has the highest churn rate 

SELECT 
Education_Level, sum(Attrition_Flag) AS Churncustomer, round((sum(Attrition_Flag)/COUNT(CLIENTNUM)) *100,2) AS churnrate
FROM bola-niyo.niyo.final_project_new
GROUP BY Education_Level
ORDER BY Education_Level ASC;


--- churn count and rate by Age group.41-60 whuch are middle age customers has the highest churn rate  

SELECT 
CASE 
WHEN Customer_Age <= 30 THEN '1-30'
WHEN Customer_Age <=40 THEN '31-40'
WHEN Customer_Age <=50 THEN '41-50'
WHEN Customer_Age <=60 THEN '51-60'
WHEN Customer_Age <=70 THEN '61-70'
WHEN Customer_Age <=80 THEN '71-80'
END AS Agegroup,sum(Attrition_Flag) AS Churncustomer, round((sum(Attrition_Flag)/COUNT(CLIENTNUM)) *100,2) AS churnrate
FROM bola-niyo.niyo.final_project_new
GROUP BY Agegroup;

-- ---count and churn rate by Card_Category. Majority of the customers has a blue credit card but the platinum card customers has a higher churn rate.

SELECT 
Card_Category, sum(Attrition_Flag) AS Churncustomer, round((sum(Attrition_Flag)/COUNT(CLIENTNUM)) *100,2) AS churnrate
FROM bola-niyo.niyo.final_project_new
GROUP BY Card_Category
ORDER BY Card_Category ASC;

--- churn count and rate by Total_Relationship_Count. customers With high number of products has a low churn rate so customer who holds few products with the bank tend to churn more.

SELECT 
Total_Relationship_Count, sum(Attrition_Flag) AS Churncustomer, round((sum(Attrition_Flag)/COUNT(CLIENTNUM)) *100,2) AS churnrate
FROM bola-niyo.niyo.final_project_new
GROUP BY Total_Relationship_Count
ORDER BY 3 DESC;

--- number of churn customers grouped by Card_Category and Total_Relationship_Count.  In each card category , customers with lower number of product has a higher churn count

SELECT Card_Category,Total_Relationship_Count,COUNT(CLIENTNUM) AS numberofchurn
FROM bola-niyo.niyo.final_project_new
WHERE Attrition_Flag = 1
GROUP BY Card_Category,Total_Relationship_Count
ORDER BY 1,3 desc;

---churn  count and rate by Contacts_Count_12_mon. Customers with high contact count has a high chrun rate. all the customers with 6 contacts actually left their credit card services

SELECT 
Contacts_Count_12_mon, sum(Attrition_Flag) AS Churncustomer, round((sum(Attrition_Flag)/COUNT(CLIENTNUM)) *100,2) AS churnrate
FROM bola-niyo.niyo.final_project_new
GROUP BY Contacts_Count_12_mon
ORDER BY Contacts_Count_12_mon ASC;
