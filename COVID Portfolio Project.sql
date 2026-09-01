--SELECT * 
--FROM PortfolioProject.dbo.CovidDeaths
--WHERE continent IS NOT NULL
--order by 3,4

--SELECT * 
--FROM PortfolioProject..CovidVaccinations
--WHERE continent IS NOT NULL
--ORDER BY 3,4



--Select location,date,total_cases,new_cases,total_deaths,population
--FROM PortfolioProject.dbo.CovidDeaths
--WHERE continent IS NOT NULL
--ORDER BY 1,2


-- total cases vs total deaths

-- shows how likelihood of dying of you contract covid

--Select location,date,total_cases,total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
--FROM PortfolioProject.dbo.CovidDeaths
--Where location like '%brazil%'
--AND continent IS NOT NULL
--ORDER BY 1,2

-- total cases vs population

-- shows what percentage of population got covid

--Select location,date,population,total_cases, (total_cases/population) * 100 as InfectionRate
--FROM PortfolioProject.dbo.CovidDeaths
--Where location like '%brazil%'
--AND continent IS NOT NULL
--ORDER BY 1,2


-- Countries with the highest infection rates

--Select location,population,MAX(total_cases)  AS Highest_Case_Total, MAX((total_cases/population)) * 100 as InfectionRate
--FROM PortfolioProject.dbo.CovidDeaths
--WHERE continent IS NOT NULL
--GROUP BY population,location
--ORDER BY InfectionRate DESC


---- Countries with the highest death count

--Select location, MAX(cast(total_deaths as int)) AS TotalDeathCount
--FROM PortfolioProject.dbo.CovidDeaths
--WHERE continent IS NOT NULL
--Group By location
--order by TotalDeathCount desc
 

-- By Continent

-- Continents with the highest infection rates

--Select location,population,MAX(total_cases)  AS Highest_Case_Total, MAX((total_cases/population)) * 100 as InfectionRate
--FROM PortfolioProject.dbo.CovidDeaths
--WHERE continent IS NOT NULL
--GROUP BY population,location
--ORDER BY InfectionRate DESC

---- Continents with the highest death counts

--Select location, MAX(cast(total_deaths as int)) AS TotalDeathCount
--FROM PortfolioProject.dbo.CovidDeaths
--WHERE continent IS NOT NULL
--Group By location
--order by TotalDeathCount desc

-- Global Numbers

Select SUM(new_cases) as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths, (SUM(cast(new_deaths as int))/sum(new_cases))*100 as 
DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not null
--group by date
order by 1,2



-- Total Population vs Vaccinations

Select death.continent, death.location, death.date, death.population, vaci.new_vaccinations
, sum(cast(vaci.new_vaccinations as int)) OVER (Partition by death.location order by death.location, death.date)
as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths death
join PortfolioProject..CovidVaccinations vaci
	On death.location = vaci.location
	and death.date = vaci.date
Where death.continent is not null
order by 2,3

--Use CTE

With PopVsVac (Continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
Select death.continent, death.location, death.date, death.population, vaci.new_vaccinations
, sum(cast(vaci.new_vaccinations as int)) OVER (Partition by death.location order by death.location, death.date)
as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths death
join PortfolioProject..CovidVaccinations vaci
	On death.location = vaci.location
	and death.date = vaci.date
Where death.continent is not null
)

Select *, (RollingPeopleVaccinated/population)*100 as Population_Vaccinated
from PopVsVac




-- TEMP TABLE
CREATE TABLE #PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
Select death.continent, death.location, death.date, death.population, vaci.new_vaccinations
, sum(cast(vaci.new_vaccinations as int)) OVER (Partition by death.location order by death.location, death.date)
as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths death
join PortfolioProject..CovidVaccinations vaci
	On death.location = vaci.location
	and death.date = vaci.date
Where death.continent is not null

Select *, (RollingPeopleVaccinated/population)*100 as Population_Vaccinated
from #PercentPopulationVaccinated

-- VIEW FOR LATER VISUALIZATIONS

CREATE VIEW PercentPopulationVaccinated as
Select death.continent, death.location, death.date, death.population, vaci.new_vaccinations
, sum(cast(vaci.new_vaccinations as int)) OVER (Partition by death.location order by death.location, death.date)
as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths death
join PortfolioProject..CovidVaccinations vaci
	On death.location = vaci.location
	and death.date = vaci.date
Where death.continent is not null

Select * 
from PercentPopulationVaccinated