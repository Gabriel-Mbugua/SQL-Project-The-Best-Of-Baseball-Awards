-- Shortest Sluggers
-- This award goes to the team with the smallest average height of its batters on a given year.

WITH filtered_teams AS
	(SELECT DISTINCT b.playerid AS playerid,
			t.teamid AS teamid,
			t.name AS teamname
		FROM batting AS b
		JOIN teams AS t ON t.teamid = b.teamid),
	heights AS
	(SELECT DISTINCT p.namegiven,
			p.height,
			f.teamname
		FROM people AS p
		JOIN filtered_teams AS f ON p.playerid = f.playerid
		WHERE p.height IS NOT NULL
		ORDER BY p.height DESC)
		
SELECT teamname,
	avg(height) as heightAvg
FROM heights
GROUP BY teamname
order by heightAvg asc;