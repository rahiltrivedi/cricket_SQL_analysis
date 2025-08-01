-- ADVANCED FEAT QUERIES

-- 1. Number of batsmen who scored centuries from each team

SELECT batting_team, COUNT(DISTINCT batsman) AS batsmen_with_centuries
FROM (
    SELECT match_id, batting_team, batsman, SUM(batsman_runs) AS total_runs
    FROM deliveries
    GROUP BY match_id, batting_team, batsman
    HAVING total_runs >= 100
) AS century_data
GROUP BY batting_team
ORDER BY batsmen_with_centuries DESC;

-- 2. Players who scored a century and took at least one wicket in the same season

-- First, find players who scored centuries (batting)
WITH centuries AS (
    SELECT match_id, batsman AS player
    FROM deliveries
    GROUP BY match_id, batsman
    HAVING SUM(batsman_runs) >= 100
),

-- Second, find players who took at least 1 wicket (bowling)
wickets AS (
    SELECT match_id, bowler AS player
    FROM deliveries
    WHERE dismissal_kind IS NOT NULL
      AND dismissal_kind NOT IN ('run out', 'retired hurt', 'obstructing the field')
    GROUP BY match_id, bowler
),

-- Join both and get the season from matches table
both_century_and_wicket AS (
    SELECT c.player, m.season
    FROM centuries c
    JOIN wickets w ON c.match_id = w.match_id AND c.player = w.player
    JOIN matches m ON c.match_id = m.id
)

-- Final result
SELECT season, player
FROM both_century_and_wicket
GROUP BY season, player
ORDER BY season;

-- 4. Fastest Fifties (50+ in fewest balls)

SELECT match_id, batsman,
       COUNT(*) AS balls_faced,
       SUM(batsman_runs) AS total_runs
FROM deliveries
WHERE batsman_runs > 0
GROUP BY match_id, batsman
HAVING total_runs >= 50
ORDER BY balls_faced ASC
LIMIT 10;


-- 5. Highest Strike Rates (min 30 balls faced)

SELECT batsman,
       COUNT(*) AS balls_faced,
       SUM(batsman_runs) AS total_runs,
       ROUND(SUM(batsman_runs) / COUNT(*) * 100, 2) AS strike_rate
FROM deliveries
WHERE batsman_runs >= 0
GROUP BY batsman
HAVING balls_faced >= 30
ORDER BY strike_rate DESC
LIMIT 10;


-- 6. Best Bowling Economy (min 4 overs bowled)

SELECT bowler,
       COUNT(*) AS balls_bowled,
       SUM(total_runs) AS runs_conceded,
       ROUND(SUM(total_runs) / COUNT(*) * 6, 2) AS economy_rate
FROM deliveries
GROUP BY bowler
HAVING balls_bowled >= 24
ORDER BY economy_rate ASC
LIMIT 10;

-- 7. Best Batting Averages (min 5 dismissals)

SELECT batsman,
       SUM(batsman_runs) AS total_runs,
       COUNT(*) AS total_dismissals,
       ROUND(SUM(batsman_runs) / COUNT(*), 2) AS average
FROM (
    SELECT batsman, batsman_runs
    FROM deliveries
    WHERE batsman IS NOT NULL
      AND player_dismissed = batsman
) AS dismissals
GROUP BY batsman
HAVING total_dismissals >= 5
ORDER BY average DESC
LIMIT 10;

-- 8. Most Runs in a Single Over

SELECT match_id, overs, batting_team, bowler, SUM(total_runs) AS over_runs
FROM deliveries
GROUP BY match_id, overs, bowler, batting_team
ORDER BY over_runs DESC
LIMIT 5;

-- 9. Top Finishing Partnerships (highest runs in any partnership)

SELECT match_id, batting_team, SUM(batsman_runs) AS partnership_runs
FROM deliveries
WHERE inning = 2
GROUP BY match_id, batting_team
ORDER BY partnership_runs DESC
LIMIT 10;

-- 10. Most Ducks (0 runs and dismissed)

SELECT batsman, COUNT(*) AS ducks
FROM deliveries
WHERE batsman_runs = 0 AND player_dismissed = batsman
GROUP BY batsman
ORDER BY ducks DESC
LIMIT 10;

