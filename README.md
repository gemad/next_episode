# Next_episode


Checking the selected series directory and identify the last opend episode, and then running the next one.

- your episodes must have a specific naming convention:
>[yourSeriesName].s[seasonNumber]e[episodeNumber].mkv (ex. friends.s1e2.mkv)

- you can run this script by typing "series" in any terminal, just create this alias by adding this line to your bashrc:
>alias series='bash ~/next_episode_repo/next_episode/next_episode.sh' #you can choose any name for your alias

**ToDo** 

- add support for multiple serires at the same time
>till now you can select between predefined multiple serires, [himym, friends]

- next step

when you run the script:
>you can decied if you just wanna play old series or add new one\
>if you choose to add new one it run a different script to allow inserting the new series required parameters
