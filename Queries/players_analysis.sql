-- 1. Total number of players
SELECT COUNT(*) AS total_players FROM players;

-- 2. Sample of player names
SELECT * FROM players LIMIT 10;

-- 3. Players who appeared in deliveries table
SELECT DISTINCT batsman AS player FROM deliveries
UNION
SELECT DISTINCT bowler FROM deliveries;

-- 4. Number of players who have batted
SELECT COUNT(DISTINCT batsman) AS unique_batsmen
FROM deliveries;

-- 5. Number of players who have bowled
SELECT COUNT(DISTINCT bowler) AS unique_bowlers
FROM deliveries;

-- 6. Players who both batted and bowled
SELECT DISTINCT d1.batsman AS player
FROM deliveries d1
JOIN deliveries d2 ON d1.batsman = d2.bowler;


-- 7. Players who got out at least once
SELECT DISTINCT player_dismissed
FROM deliveries
WHERE player_dismissed IS NOT NULL;

-- 8. Players who were dismissed most frequently
SELECT player_dismissed, COUNT(*) AS times_dismissed
FROM deliveries
WHERE player_dismissed IS NOT NULL
GROUP BY player_dismissed
ORDER BY times_dismissed DESC
LIMIT 5;
