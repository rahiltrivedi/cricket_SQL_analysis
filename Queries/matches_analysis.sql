-- 1. Total number of matches played
SELECT COUNT(*) AS total_matches FROM matches;

-- 2. Number of matches played each season
SELECT season, COUNT(*) AS matches_per_season
FROM matches
GROUP BY season
ORDER BY season;

-- 3. Total matches played at each venue
SELECT venue, COUNT(*) AS matches_at_venue
FROM matches
GROUP BY venue
ORDER BY matches_at_venue DESC;

-- 4. Number of matches each team has won
SELECT winner, COUNT(*) AS total_wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY total_wins DESC;

-- 5. Toss decision analysis
SELECT toss_decision, COUNT(*) AS count
FROM matches
GROUP BY toss_decision;

-- 6. Impact of toss on match result
SELECT 
    toss_winner = winner AS toss_win_equals_match_win,
    COUNT(*) AS matches
FROM matches
WHERE winner IS NOT NULL
GROUP BY toss_win_equals_match_win;

-- 7. Top players of the match
SELECT player_of_match, COUNT(*) AS awards
FROM matches
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 5;

-- 8. Matches with a super over
SELECT season, team1, team2, winner
FROM matches
WHERE result = 'tie';
