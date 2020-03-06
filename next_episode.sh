#!/bin/bash

ls -lut --time=atime /home/$USER/FRIENDS > watching_history.txt

sed -n '2{p;q}' watching_history.txt > last_episode_line.txt

res0=`grep -oP "friends.s\d*e\d*" last_episode_line.txt` 
echo "$res0" > last_episode_line.txt

res1=`grep -oP "\d*e\d*" last_episode_line.txt`
echo "$res1" > last_episode_line.txt

res2=`grep -oP "\d*" last_episode_line.txt`
echo "$res2" > last_episode_line.txt

season_num=`sed -n '1{p;q}' last_episode_line.txt`

episode_num=`sed -n '2{p;q}' last_episode_line.txt`

	if [[ ${season_num} == "3" ]]
	then
		max_episode=25
	elif [[ ${season_num} == "6" ]]
	then
		max_episode=25
	elif [[ ${season_num} == "9" ]]
	then
		max_episode=23
 	elif  [[ ${season_num} == "10" ]]
	then	
		max_episode=17
	else
		max_episode=24
	fi
			
if [[ "$episode_num" -lt "$max_episode" ]]
then
	next_episode=$(($episode_num+1))
	next_season="$season_num"

else
	if [[ $season_num -lt "10" ]]
  	then
		next_season=$(($season_num+1))
		next_episode="1"
	else
		next_season="1"
		next_episode="1"
	fi
fi

final_num=friends.s"$next_season"e"$next_episode".mkv
vlc "/home/marcelle/FRIENDS/$final_num"
