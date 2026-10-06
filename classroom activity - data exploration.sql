/*
--Query 1--
-- Find a player named 'Newton89' 
-- and provide the amount of hard and soft currency they have accumulated. --
SELECT * FROM players
where name = 'Newton89';

--Query 2--
-- Find 20 players who have more than 500 hard currency 
-- and have player fewer than 100 matches. 
-- The results should be in descending order by match count. --
select * from players player_id
where hard_currency > 500
and match_count < 100
order by match_count desc;

--Query 3--
-- Retrieve the 10 most recent login sessions. --
select * from sessions
order by start_time desc
limit 10;
*/

--Query 4--
-- Find only the names and ids of all players who have 
-- played more than 150 matches 
-- but less than 300 matches and are not named 'Herta93'. --
select name, player_id from players
where match_count > 150
and match_count < 300
and not name = 'Herta93';
