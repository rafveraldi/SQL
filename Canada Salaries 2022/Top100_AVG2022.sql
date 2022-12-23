-- Creating a table with annualized salaries --
WITH wage2022 as
	(SELECT NOC_CNP, NOC_Title,PROV,
	-- Assuming 2002 had 249 working days with 8 working hours per day = 1992 working hours -- 
	CASE WHEN Annual_Wage_Flag_Salaire_annuel IS False THEN(Average_Wage_Salaire_Moyen * 1992) ELSE Average_Wage_Salaire_Moyen END as Average_Wage_Annual
	FROM wage2022opendata)

-- TOP 100 Average of Average Salaries in Canada --
SELECT NOC_CNP, NOC_Title,
round(avg (Average_Wage_Annual),2) as AVG_Salary
FROM wage2022
GROUP BY NOC_CNP, NOC_Title
order by AVG_Salary DESC
LIMIT 100
