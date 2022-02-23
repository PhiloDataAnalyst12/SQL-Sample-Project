SELECT * FROM covid.`covid death`;

--Select Data that we are going to use

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid.`covid death`

--Looking at Total Cases Vs Total Deaths
--Shows likelihood of death if you contract Covid in Africa


SELECT date, location, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM covid.`covid death`
Where location like '%Africa%'

--Looking at Total Cases Vs Population
--Shows what percentage of population got covid

SELECT date, location, total_cases, population, (total_cases/population)*100 as PercentPopulationInfected
FROM covid.`covid death`
Where location like '%Africa%'

--Looking at Countries with Highest Infection Rate Compared to Population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM covid.`covid death`
Group by location, population;
Order by PercentPopulationInfected desc

---Showing Countries with Highest Death Count Per Population

SELECT location, MAX(total_deaths) as TotalDeathCount
FROM covid.`covid death`
Group by location
Order by TotalDeathCount desc
