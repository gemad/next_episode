#!/bin/bash

read -p "please enter one of (friends, himym): " series_name
ls -lut --time=atime /media/$USER/EE422C35422C0545/Movies/$series_name > /home/$USER/next_episode_repo/next_episode/watching_history.txt

sed -n '2{p;q}' /home/$USER/next_episode_repo/next_episode/watching_history.txt > /home/$USER/next_episode_repo/next_episode/last_episode_line.txt

res0=`grep -oP "$series_name.s\d*e\d*" /home/$USER/next_episode_repo/next_episode/last_episode_line.txt` 
echo "$res0" > /home/$USER/next_episode_repo/next_episode/last_episode_line.txt

res1=`grep -oP "\d*e\d*" /home/$USER/next_episode_repo/next_episode/last_episode_line.txt`
echo "$res1" > /home/$USER/next_episode_repo/next_episode/last_episode_line.txt

res2=`grep -oP "\d*" /home/$USER/next_episode_repo/next_episode/last_episode_line.txt`
echo "$res2" > /home/$USER/next_episode_repo/next_episode/last_episode_line.txt

season_num=`sed -n '1{p;q}' /home/$USER/next_episode_repo/next_episode/last_episode_line.txt`

episode_num=`sed -n '2{p;q}' /home/$USER/next_episode_repo/next_episode/last_episode_line.txt`

if [[ $series_name -eq "friends" ]]
then
	if [[ ${season_num} -eq "3" ]]
	then
		max_episode=25
	elif [[ ${season_num} -eq "6" ]]
	then
		max_episode=25
	elif [[ ${season_num} -eq "9" ]]
	then
		max_episode=23
 	elif  [[ ${season_num} -eq "10" ]]
	then	
		max_episode=17
	else
		max_episode=24
	fi
	max_seasons=10

elif [[ $series_name -eq "himym" ]]
then
	if [[ ${season_num} == "1" ]]
	then
		max_episode=22
	elif [[ ${season_num} == "2" ]]
	then
		max_episode=22
	elif [[ ${season_num} == "3" ]]
	then
		max_episode=20
	else
		max_episode=24
	fi
	max_seasons=9
else

echo "wrong choise, try again"
fi

		
if [[ "$episode_num" -lt "$max_episode" ]]
then
	next_episode=$(($episode_num+1))
	next_season="$season_num"

else
	if [[ "$season_num" -lt "$max_seasons" ]]
  	then
		next_season=$(($season_num+1))
		next_episode="1"
	else
		next_season="1"
		next_episode="1"
	fi
fi

# for debugging
#echo $max_episode > /home/$USER/next_episode_repo/next_episode/hello.txt
#echo $season_num >> /home/$USER/next_episode_repo/next_episode/hello.txt
#echo $episode_num >> /home/$USER/next_episode_repo/next_episode/hello.txt
#echo $next_season >> /home/$USER/next_episode_repo/next_episode/hello.txt
#echo $next_episode >> /home/$USER/next_episode_repo/next_episode/hello.txt
#echo $max_seasons >> /home/$USER/next_episode_repo/next_episode/hello.txt

final_num="$series_name".s"$next_season"e"$next_episode".mkv
vlc "/media/$USER/EE422C35422C0545/Movies/$series_name/$final_num"
