-- Most Bang For Their Buck In 2010
-- This award goes to the team that had the smallest “cost per win” in 2010.
-- Cost per win is determined by the total salary of the team divided by the number of wins in a given year.

SELECT t.name AS team,
	t.w,
	sum(salary) AS totalsalary,
	round(sum(salary) / t.w) AS costperwin
FROM salaries AS s
JOIN teams AS t ON t.teamid = s.teamid
WHERE s.yearid = 2010
GROUP BY 1,2
ORDER BY costperwin ASC;