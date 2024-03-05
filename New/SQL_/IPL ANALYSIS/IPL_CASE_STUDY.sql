--CREATE DATABASE IPL
USE IPL
CREATE TABLE IPL([id] INT NOT NULL,
INNING TINYINT NOT NULL,OVERS TINYINT NOT NULL,
[ball]TINYINT NOT NULL,
BATSMAN NVARCHAR(50) NOT NULL,
[non_striker] NVARCHAR(50) NOT NULL,
[bowler] NVARCHAR(50) NOT NULL,
[batsman_runs] TINYINT NOT NULL,
[extra_runs] TINYINT NOT NULL,
[total_runs] TINYINT NOT NULL,
[non_boundary] TINYINT NOT NULL,
[is_wicket] BIT NOT NULL,
[dismissal_kind]  NVARCHAR(50) NOT NULL,
[player_dismissed] NVARCHAR(50) NOT NULL,
[fielder] NVARCHAR(50) NOT NULL,
[extras_type] NVARCHAR(50) NOT NULL,
[batting_team] NVARCHAR(50) NOT NULL,
[bowling_team] NVARCHAR(50) NOT NULL)


INSERT INTO IPL
SELECT * FROM ipl1
UNION
SELECT * FROM ipl2
UNION
SELECT * FROM ipl3
UNION
SELECT * FROM ipl4

SELECT COUNT(*) FROM IPL
SELECT * FROM IPL

SELECT * FROM MATCHES

--
-- number of matches n each season
select years, count(distinct id) [no of matches] from
(select year(date) years, id from MATCHES) a
group by years
---
--count the player of the match

select player_of_match, count(player_of_match) counts from matches
group by player_of_match order by counts desc

--most player of the match per season
select* from
(select player_of_match,years, counts, rank() over(partition by years order by counts desc) ranks from
(select player_of_match,year(date) as years,count(player_of_match) counts from matches
group by player_of_match, year(date))a)b
where ranks = 1
--
--team won highest no. of matches
select winner , count(winner) winning_match from matches
group by winner order by winning_match desc

--top 5 vanues where match was played
select top 5 venue , count(venue) cnt from matches
group by venue order by cnt desc

--
--highest run by batsman 
select * from IPL

select top 1 batsman, count(total_runs) total_run from IPL
group by batsman order by count(total_runs) desc


---highest six
select batsman, count(batsman_runs) ranks from
(select * from ipl
where batsman_runs = 6)a
group by batsman
order by ranks DESC

--- highest 4
select batsman, count(batsman_runs) ranks from
(select * from ipl
where batsman_runs = 4)a
group by batsman
order by ranks desc
select * from Matches


-- highest strike rate ABOVE 3000 RUNS
select * from
(select batsman, batsman_runs, ((batsman_runs*1.0)/total_balls)*100 strike_rate from
(select batsman, sum(batsman_runs) batsman_runs, count(batsman) total_balls from ipl
group by batsman)a)b
where batsman_runs>=3000 order by strike_rate desc

--economy_rate
select bowler, (runs/(total_balls*1.0)) economy_rate from
(select bowler, count(bowler) total_balls, sum(total_runs) runs
from ipl
group by bowler)a
where total_balls>300
order by economy_rate desc

--distinct id (no. of matches)
select count(distinct id) from ipl

--matches won by the team
select winner, count(winner) AS  WINING_TEAM from matches 
group by winner

-- top 5 player
select top 5 player_of_match, count(*) as mom from matches
group by player_of_match

order by  mom desc

----
select * from matches
select * from IPL
---

-- teams who did first_batting after winning the toss

select toss_winner,count(toss_decision) first_batting from matches
where toss_decision = 'bat'
group by toss_winner


--strike rate of each batsman
select BATSMAN, sum(BATSMAN_RUNS) as runs_scored, count(ball) as totalBallFaced,
(sum(BATSMAN_RUNS)*100/count(*)) as strikeRate
from IPL
where BATSMAN_RUNS>0
group by BATSMAN

----calculate the economy rate of each bowler
select Bowler, sum(TOTAL_RUNS) as totalRunsConceded,
count(ball) as totalBallsBowled,
(sum(TOTAL_RUNS)*6.0/count(*)) as economyRate
from IPL
where TOTAL_RUNS>0
group by bowler


---rank teams based on their total_wins
select WINNER AS TEAM, COUNT(WINNER) WINNER, rank() over(order by COUNT(WINNER) desc) as rank_,
DENSE_rank() over(order by COUNT(WINNER) desc) as DENSE_rank
from Matches
group by WINNER


---calculate the win % of each team
select WINNER,
COUNT(WINNER)*100.0/(SELECT count(winner) FROM Matches) as win_percent
from Matches
group by WINNER
ORDER BY WIN_PERCENT DESC;


---100+ runs
SELECT * FROM
(select BATSMAN,  COUNT(batsman_runs) AS RUN
from IPL GROUP BY BATSMAN)a
where RUN >=100
ORDER BY RUN DESC


---who scored runS BETWEEN 2000 AND 3000 BY HAVING
select BATSMAN, SUM(BATSMAN_RUNS) AS BATSMAN_RUNS
from IPL
GROUP BY BATSMAN
HAVING SUM(BATSMAN_RUNS)>2000 AND SUM(BATSMAN_RUNS)<3000 
ORDER BY BATSMAN_RUNS ASC

---total runs scored by each team WITH RANK AND DENSE RANK

SELECT * FROM Matches
SELECT * FROM IPL

SELECT BATTING_TEAM, SUM(TOTAL_RUNS) AS TEAM_SCORE,
rank() over(order by SUM(TOTAL_RUNS) desc) as rank_,
DENSE_rank() over(order by SUM(TOTAL_RUNS) desc) as DENSE_rank FROM IPL GROUP BY BATTING_TEAM ---ORDER BY TEAM_SCORE DESC

---total runs scored by each PLAYER WITH RANK AND DENSE RANK
SELECT * FROM
(select BATSMAN, sum(BATSMAN_RUNS) as runs_scored,
rank() over(order by SUM(TOTAL_RUNS) desc) as rank_,
DENSE_rank() over(order by SUM(TOTAL_RUNS) desc) as DENSE_rank FROM IPL GROUP BY BATSMAN)A
WHERE RANK_>=110 AND RANK_<=150
GROUP BY BATSMAN,runs_scored, RANK_,DENSE_rank



