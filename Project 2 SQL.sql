use project_2;
#Ques 1
#1.	How many olympics games have been held?
select count(distinct(Games)) as Total_Games
from athlete_event;

#Ques2
#2.	List down all Olympics games held so far.
select distinct(Games) as All_Games
from athlete_event;

#Ques3
#3.	Mention the total no of nations who participated in each olympics game?

select count(distinct(NOC)) as Total_Games
from athlete_event;

#Ques4
#4.	Which year saw the highest and lowest no of countries participating in olympics?

select Count(distinct(NOC)) as No_of_Country , Year
from athlete_event
group by Year
order by No_of_Country desc
limit 1;

select Count(distinct(NOC)) as No_of_Country, Year
from athlete_event
group by Year
order by No_of_Country asc
limit 1;

#Ques5
#5.	Which nation has participated in all of the olympic games?

select count(distinct(Games)) as Total_Games
from athlete_event;

 select Count(Distinct(Games)) as Total_Games, Team
 from athlete_event
 group by Team
 having Total_Games = 51
 order by Total_Games desc;
 
 #Ques6
 #6.Identify the sport which was played in all summer olympics.
 
 select Count(distinct(Games)) 
 from athlete_event
 where Games like '%Summer%';
 
select Count(distinct(Games)) as Total_summer, Sport
from athlete_event
where Games like '%Summer%'
group by  Sport
having Total_summer = 29;

#Ques 7
#7.	Which Sports were just played only once in the olympics?

select Count(distinct(Games)) as Total_Played, Sport
from athlete_event
group by  Sport
having Total_Played = 1 ;

#Ques 8
#8.	Fetch the total no of sports played in each olympic games.
select count(distinct(Sport)) as Total_sport, Games
from athlete_event
group by Games
order by Total_sport desc;

#Ques 9
#9.	Fetch details of the oldest athletes to win a gold medal.

Select * from athlete_event
where Medal = 'Gold' and Age= 64
order by Age Desc;

#Ques 10
#1O.Fetch the top 5 athletes who have won the most gold medals.

Select Name , count(Medal) as total_gold
from athlete_event
where Medal= 'Gold'
Group by Name
order by total_gold desc
limit 5;

#Ques 11
#11.Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
Select Name , count(Medal) as total_gold
from athlete_event
where Medal= 'Gold' or Medal='Silver' or Medal= 'Bronze'
Group by Name
order by total_gold desc
limit 5;



#Ques 12
#12. Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.

select NOC, count(Medal) as Total_medal 
from athlete_event
where Medal='Gold' or Medal= 'Silver' or Medal= 'Bronze'
group by NOC 
order by Total_medal desc
limit 5;

#Ques 13
#13.List down total gold, silver and bronze medals won by each country.

select NOC, count(Medal) as Total_medal , Medal
from athlete_event
where Medal='Gold' or Medal= 'Silver' or Medal= 'Bronze'
group by NOC , Medal
order by NOC;

#14.List down total gold, silver and bronze medals won by each country corresponding
# to each olympic games.

select NOC, count(Medal) as Total_medal , Medal , Games
from athlete_event
where Medal='Gold' or Medal= 'Silver' or Medal= 'Bronze'
group by NOC , Medal,Games  
order by NOC; 

#or
 
SELECT NOC,
       COUNT(CASE WHEN Medal = 'Gold' THEN 1 END) AS Gold,
       COUNT(CASE WHEN Medal = 'Silver' THEN 1 END) AS Silver,
       COUNT(CASE WHEN Medal = 'Bronze' THEN 1 END) AS Bronze,
       Games
FROM athlete_event
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY NOC, Games
ORDER BY NOC;







