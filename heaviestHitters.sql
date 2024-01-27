-- Heaviest Hitters
-- This award goes to the team with the highest average weight of its batters on a given year.

WITH filtered_teams AS
	(SELECT DISTINCT b.playerid AS playerid,
			t.teamid AS teamid,
			t.name AS teamname
		FROM batting AS b
		JOIN teams AS t ON t.teamid = b.teamid),
	weights AS
	(SELECT DISTINCT p.namegiven,
			p.weight,
			f.teamname
		FROM people AS p
		JOIN filtered_teams AS f ON p.playerid = f.playerid
		WHERE p.weight IS NOT NULL
		ORDER BY p.weight DESC)
		
SELECT teamname,
	avg(weight) as weightAvg
FROM weights
GROUP BY teamname
order by weightAvg desc;