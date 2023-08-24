

SELECT * FROM `bola-niyo.niyo.Bank_Churner`;



SELECT Gender, COUNT(CLIENTNUM) AS numberofclient, Attrition_Flag from `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Gender, Attrition_Flag;

-- 
SELECT Gender, COUNT(Gender) AS numberofgender, Attrition_Flag from `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Gender, Attrition_Flag ;

SELECT Income_Category, Gender, Attrition_Flag from `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Income_Category,Gender, Attrition_Flag
ORDER BY Income_Category;

SELECT Income_Category, Gender, Attrition_Flag from `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Income_Category,Gender, Attrition_Flag
ORDER BY Income_Category;

SELECT COUNT(CLIENTNUM), AVG(Customer_Age), MIN(Customer_Age), MAX(Customer_Age) FROM `bola-niyo.niyo.Bank_Churner`;
--- number of customer by gender and education

select * from bola-niyo.niyo.Bank_Churner;

SELECT Gender, COUNT(CLIENTNUM) AS numberofcustomer,Education_Level 
FROM `bola-niyo.niyo.Bank_Churner`
GROUP BY Gender, Education_Level;

-- Number of customer based on Marital status and income category

SELECT Income_Category,Marital_Status,COUNT(CLIENTNUM) AS numberofcustomer
FROM `bola-niyo.niyo.Bank_Churner`
GROUP BY Marital_Status, Income_Category
ORDER BY COUNT(CLIENTNUM) desc;

-- Number of customer based on Marital status and income category

SELECT Income_Category,Marital_Status,COUNT(CLIENTNUM) AS numberofcustomer
FROM `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Marital_Status, Income_Category
ORDER BY COUNT(CLIENTNUM) desc;


-- Number of customer based on Marital status and income category 
-- order by Marital status

SELECT Income_Category,Marital_Status,COUNT(CLIENTNUM) AS numberofcustomer
FROM `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Marital_Status, Income_Category
ORDER BY Marital_Status;


-- Number of customer based on Marital status and income category

SELECT Income_Category,Marital_Status,COUNT(CLIENTNUM) AS numberofcustomer
FROM `bola-niyo.niyo.Bank_Churner`
GROUP BY Marital_Status, Income_Category
ORDER BY numberofcustomer desc;

-- number of month inactive among customer based on education level and gender

SELECT Income_Category,Marital_Status,COUNT(CLIENTNUM) AS numberofcustomer
FROM `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Marital_Status, Income_Category
ORDER BY numberofcustomer DESC;

-- --number of month inactive IN 12 MONTH by the income category 

SELECT Income_Category,AVG(Months_Inactive_12_mon) AS AVGinactivemonth, count(CLIENTNUM) AS numberofcustomer
FROM `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Income_Category
ORDER BY numberofcustomer DESC;

-- credit limit range based on age and income???????????????



SELECT Income_Category,Marital_Status,COUNT(CLIENTNUM) AS numberofcustomer
FROM `bola-niyo.niyo.Bank_Churner`
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Marital_Status, Income_Category
ORDER BY numberofcustomer DESC;



select * from bola-niyo.niyo.Bank_Churner;

SELECT 
CASE 
WHEN Gender IN ('M','F') AND Customer_Age < 35 THEN 'Young age'
WHEN Gender IN ('M','F') AND Customer_Age BETWEEN 31 AND 65 THEN 'Middle group'
WHEN Gender IN ('M','F') AND Customer_Age > 65 THEN 'Old age'
ELSE 'Ageunknown'
END AS GENDERANDAGE,COUNT(CLIENTNUM) AS numberofcustomer,
FROM bola-niyo.niyo.Bank_Churner
GROUP BY GENDERANDAGE;
