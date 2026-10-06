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
	
*/
select player_id, name
from players
where name like '%18%'
order by name asc;