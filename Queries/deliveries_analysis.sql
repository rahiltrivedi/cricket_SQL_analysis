-- 1. Total deliveries in dataset
SELECT COUNT(*) AS total_deliveries FROM deliveries;

-- 2. Total runs scored
SELECT SUM(total_runs) AS total_runs_scored FROM deliveries;

-- 3. Top run-scorers
SELECT batsman, SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC
LIMIT 5;

-- 4. Batsmen with most boundaries (4s and 6s)
SELECT batsman,
    SUM(CASE WHEN batsman_runs = 4 THEN 1 ELSE 0 END) AS fours,
    SUM(CASE WHEN batsman_runs = 6 THEN 1 ELSE 0 END) AS sixes
FROM deliveries
GROUP BY batsman
ORDER BY sixes DESC, fours DESC
LIMIT 5;

-- 5. Bowlers with most wickets (excluding run-outs)
SELECT bowler, COUNT(*) AS wickets
FROM deliveries
WHERE dismissal_kind IS NOT NULL
  AND dismissal_kind NOT IN ('run out', 'retired hurt', 'obstructing the field')
GROUP BY bowler
ORDER BY wickets DESC
LIMIT 5;

-- 6. Most economical bowlers (min 100 balls bowled)
SELECT bowler,
       COUNT(*) AS balls_bowled,
       SUM(total_runs) AS runs_conceded,
       ROUND(SUM(total_runs) / COUNT(*) * 6, 2) AS economy
FROM deliveries
GROUP BY bowler
HAVING balls_bowled > 100
ORDER BY economy ASC
LIMIT 5;

-- 7. Team vs team performance (total runs in limited data)
SELECT batting_team, bowling_team, SUM(total_runs) AS runs
FROM deliveries
GROUP BY batting_team, bowling_team
ORDER BY runs DESC;

-- 8. Most dismissals by bowler-batsman pair
SELECT bowler, batsman, COUNT(*) AS dismissals
FROM deliveries
WHERE player_dismissed = batsman
GROUP BY bowler, batsman
ORDER BY dismissals DESC
LIMIT 5;
