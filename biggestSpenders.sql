-- Biggest Spenders
-- This award goes to the team with the largest total salary of all players in a given year

SELECT t.name, s.yearid, sum(salary) as totalSalary
FROM salaries AS s
JOIN teams AS t ON t.teamid = s.teamid
group by 1,2
order by totalSalary desc;