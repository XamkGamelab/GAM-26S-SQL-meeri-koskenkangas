/*
1. First identify which table(s) you need.
2. Identify which columns contain the information you need.
3. Write down the filtering conditions in plain language before writing the SQL.
4. Write and test the query.
5. Add a short SQL comment above each query explaining what the query is intended to retrieve.
*/

/*

	/* Query 1

	Write a query that retrieves the following information for every player:
	- player_id
	- name
	- created_at

	Order the results by created_at, with the newest players first. */


select player_id, name, created_at 
from players 
order by created_at desc;
*/

/*
	/* Query 2

	Write a query that retrieves all players who registered after:
	2026-09-23 12:00:00
	
	Show their name and registration timestamp.
	Order the results from the newest registration to the oldest. */


select name, created_at
from players
where created_at > '2026-09-23 12:00:00'
order by created_at desc;
*/

/*
	/* Query 3

	Write a query that retrieves the names of all players whose registration timestamp falls between:
	2026-09-23 22:50:00 and 2026-09-23 23:50:00.

	Only show the player's name and registration timestamp.	*/


select name, created_at
from players
where created_at between '2026-09-23 22:50:00' and '2026-09-23 23:50:00'
order by created_at desc;

-- Laptop language settings messing with the results, funnnnn 
*/

/*
	/* Query 4

	Write a query that retrieves all available information about the player named:
	Xavier49

	Do not assume that the player's name is unique unless you verify this from the data.*/

select * from players
where name = 'Xavier49';
*/

/*
	/* Query 5

	Write a query that retrieves all players whose name contains the text:
	18

	Show their player ID and name.
	Order the results alphabetically by name. */
	

select player_id, name
from players
where name like '%18%'
order by name asc;
*/

/*
	Query 6
	
	Write a query that retrieves all completed matches where:
	    player_0_id is not null, and
	    player_1_id is not null.
	
	Show the match ID and the two player IDs.
	Order the matches by their completion time, newest first.


select id, player_0_id, player_1_id
from match_end
where player_0_id is not null and player_1_id is not null
order by end_time desc;
*/

/*
	Query 7

	Write a query that shows the twenty (20) most recently completed matches from the match_end table.
	Show enough information for someone reading the result to identify:
	    the match
	    the completion time
	    the participating players
	    the winner
	
	Order the results from the most recently completed match to the oldest.


select id, end_time, player_0_id, player_1_id, winner_id
from match_end
where player_0_id is not null and player_1_id is not null
order by end_time desc;
*/

/*
	Query 8

	Retrieve all sessions belonging to the player named:	
	ElbertKihn.	
	Show:	
	    session ID
	    start time

	Order the sessions chronologically.	
	
	Hint: The sessions table stores the player_id, while the player's name is stored in the players table. 
	Think about how you can obtain the ID you need without using a JOIN.


	-- I need the name column from the players table
	
	select name, player_id
	from players
	where name = 'ElbertKihn';

	and
	
	select id, start_time
	from sessions
	order by start_time desc;

	-- Also the player_id has to be the same so uhhh


select id, start_time
from players t1, sessions t2
where t1.name = 'ElbertKihn' and t1.player_id = t2.player_id
order by start_time desc;
*/

/*
	Query 9

	Retrieve all completed matches in which ElbertKihn participated.
	
	A player may appear as either:	
	    player_0_id, or
	    player_1_id.
		
	Show:	
	    match ID
	    player 0
	    player 1
	    winner
	    completion time
	
	Do not use a JOIN.	
	Pay particular attention to the OR condition.


select 
	t2.id as matchID, 
	t2.player_0_id as player0, 
	t2.player_1_id as player1, 
	t2.winner_id as winner, 
	t2.end_time
	
from 
	players t1, 
	match_end t2
	
where t1.name = 'ElbertKihn' 
	and (t1.player_id = t2.player_0_id 
	or   t1.player_id = t2.player_1_id)
	
order by end_time desc;
*/

/*
	Query 10
	
	Retrieve all completed matches won by Chester70.
	
	Show:	
	    match ID
	    completion time
	    winner
	
	Do not use a JOIN.


select 
	t2.id as match_ID, 
	t2.end_time,
	t2.winner_id as winner
	
from 
	players t1, 
	match_end t2
	
where t1.name = 'Chester70' 
	and (t1.player_id = t2.winner_id)
	
order by end_time desc;
*/

/*
	Query 11
	
	Retrieve all sessions that started between:
	
	2026-09-23 15:00:00 and 2026-09-23 15:05:00.
	
	Show:
	    session ID
	    player ID
	    start time
	
	Order the results chronologically.


select 	id as session_id,
		player_id,
		start_time
from sessions
where start_time between '2026-09-23 15:00:00' and '2026-09-23 15:05:00'
order by start_time asc;
*/

/*
	Query 12
	
	Retrieve all completed matches where either:
	    ElbertKihn participated, or
	    the match was completed after 2026-09-23 18:00:00.
	
	Show:
	    match ID
	    completion time
	    player 0
	    player 1
	    winner
	
	Order by completion time, newest first.
	
	Be careful about how AND and OR interact.


select * from match_end

where 	
	player_0_id in (select player_id from players where name = 'ElbertKihn') or
	player_1_id in (select player_id from players where name = 'ElbertKihn') or
	end_time > '2026-09-23 18:00:00'
	-- greater than because a bigger number on the timestamp means that it's after the minimum timestamp (just explaining my logic if I get this wrong)
	
order by end_time desc;

-- ElbertKihn player id: ee58f6d6-3195-abed-ae39-ea8d0a709195
*/

/*
	Query 13

	Retrieve the 10 oldest player registrations.
	
	Show:
	    player name
	    created_at
	
	Order the results from oldest to newest.

*/

select name, created_at
from players
order by created_at asc
limit 10;

