import os
#to know the current operating system ,
# use it to change the play command according to the OS 
import platform
print (platform.system())

Linux_player_command="vlc" 
current_season=""
current_episode=""

#1)read the file to update the current season and epsode 
#2)generate the reset of the palyer command 
#3) update the file with the next eps 
####(corner case to handle the last eps of the season)
#4) run the generated command usinfg the function os.system()
