-- select all
select *
from [Min Wages].dbo.MinimumWageData


-- select the important values used in this analysis
select year, state, Effective#Minimum#Wage, Effective#Minimum#Wage#2020#Dollars, CPI#Average
from [Min Wages].dbo.MinimumWageData	

                        
						                         -- QUERIES SPECIFICALLY RELATING TO MY TABLEAU PUBLIC VIZ

-- Find the AVERAGE EFFECTIVE MIN WAGE for each STATE for the YEAR of 2020 for example (YEAR can be 1968 - 2020)
-- comment out 'where year = x' if looking to calcuate the Avg Effective Min Wage for ALL YEARS (1968 - 2020) combined or include it if looking to focus specific on a particular year
select state, avg(Effective#Minimum#Wage) AS Avg_Effective_Min_Wage
from [Min Wages].dbo.MinimumWageData	
--where year = 2020
group by state
order by Avg_Effective_Min_Wage desc, state


-- Find the difference between the AVERAGE CPI to AVERAGE EFFECTIVE MIN WAGE for each YEAR. 
-- comment out 'where state = x' if looking to calculate CPI_Wage_Difference for ALL STATES combined or include it if looking to focus specifically on a particular state
select year, avg(CPI#Average) as AVG_CPI, avg(Effective#Minimum#Wage) as AVG_Effective_Min_Wage, avg(CPI#Average) - avg(Effective#Minimum#Wage) as CPI_Wage_Difference
from [Min Wages].dbo.MinimumWageData	
--where state = 'Illinois'
group by year
order by year


-- Find the difference between the AVERAGE CPI to AVERAGE EFFECTIVE MIN WAGE for every STATE. 
-- comment out 'where year = x' if looking to calculate CPI_Wage_Difference for ALL YEARS combined or include it if looking to focus specifically on a particular year
select state, avg(CPI#Average) as AVG_CPI, avg(Effective#Minimum#Wage) as AVG_Effective_Min_Wage, avg(CPI#Average) - avg(Effective#Minimum#Wage) as CPI_Wage_Difference
from [Min Wages].dbo.MinimumWageData	
--where year = 2020
group by state
order by state


                                  -- OTHER QUERIES YOU CAN USE TO EXPLORE DIFFERENT PROBLEMS / ANALYSIS RELATING TO USA MIN WAGE DATA. 
				                                             -- (DID NOT INCLUDE IN TABLEAU PUBLIC VIZ)

-- Find the STATE with the HIGHEST EFFECTIVE MIN WAGE for a specific YEAR
select year, state, Effective#Minimum#Wage
from [Min Wages].dbo.MinimumWageData	
where year = 2020 -- place x year here
order by Effective#Minimum#Wage desc
limit 1 -- for certain databases, LIMIT does not exist and leads to error. 'TOP 1' needs to be added to the first line before year (select TOP 1 year) instead for the same effect. 

-- Analyze the trend of a specific type of minimal wage (State, Federal, Effective) over the years
select year, avg(Effective#Minimum#Wage) as AvgEffectiveMinWage -- Options: avg(Effective#Minimum#Wage), avg(State#Minimum#Wage), avg(Federal#Minimum#Wage)
from [Min Wages].dbo.MinimumWageData	
group by year -- to choose start and end: where year between '2000' and '2020'
order by year 

-- Compare the difference between the Effective Min Wage for x year to the Effective Min Wage in 2020 dollars for each state
-- (EFFECTIVE MIN WAGE can be changed to STATE or FEDERAL if needed. Make sure to change both the standard and 2020 Dollars version)
select year, state, avg(Effective#Minimum#Wage) as EffectiveMinWageYear, avg(Effective#Minimum#Wage#2020#Dollars) as EffectiveMinWage2020
from [Min Wages].dbo.MinimumWageData	
group by state, year
order by state

-- Compare the EFFECTIVE MIN WAGE between two different STATES for a specific YEAR
select year, state, Effective#Minimum#Wage
from [Min Wages].dbo.MinimumWageData
where state in ('Illinois', 'California')
and year = 2020

-- Compare the EFFECTIVE MIN WAGE between two different YEARS for a specific STATE
select year, state, Effective#Minimum#Wage
from [Min Wages].dbo.MinimumWageData
where year in (2020, 2000)
and state = 'Illinois'

-- Compare the relationship between Effective Min Wage to Consumer Price Index (CPI) for a specific state
select year, state, Effective#Minimum#Wage, CPI#Average
from [Min Wages].dbo.MinimumWageData
where state = 'Illinois'
