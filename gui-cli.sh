#------------ get and variable -------------------
target=$(systemctl get-default)

cli='multi-user.target'
gui='graphical.target'

#------------ functions --------------------------

if [ "$target" = "$cli" ]; then
    set=$gui
    interface=CLI
    display=GUI
else
    set=$cli
    interface=GUI
    display=CLI
fi

#------------ GUI ---------------------------------

while true; do

read -p "The current environment is $interface. You want to change to $display? (y/n) " yn

case $yn in 
	[yY] )  sudo systemctl set-default $set
            echo The environment was changed to $display;
		break;;
	[nN] )  echo exiting...;
		exit;;
	* )     echo invalid response;;
esac

done

#------------ End ---------------------------------