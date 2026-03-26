#!/bin/bash
echo "Welcome to this Quickshell config Install Script."
echo "Do you wish to backup your old quickshell config?"
boolChoice=("Yes" "No" "Quit")
NEW_CONFIG_LOCATION=$(pwd)
pwd
PS3="-> "
select opt in "${boolChoice[@]}"
do
    case $REPLY in
        "Yes"|"1")
            BACKUP_DIR=~/.config/QUICKSHELL_BACKUP_$(date +"%F_%H:%M:%S")
            echo "Backing up Quickshell files"
            cp -r ~/.config/quickshell/ $BACKUP_DIR
            break
            ;;
        "No"|"2")
            echo "Skipping Backup."
            break
            ;;
        "Quit"|"3")
            exit
            ;;
        *)
            echo "That's not a valid answer, try again"
            ;;
    esac
done
echo "Are you sure you want to install this quickshell config?"
select opt in "${boolChoice[@]}"
do
    case $REPLY in
        "Yes"|"1")
            rm -rf ~/.config/quickshell/
            cp -r NEW_CONFIG_LOCATION ~/.config/quickshell
            break
            ;;
        "No"|"2"|"Quit"|"3")
            echo "Why did you run this then?"
            exit
            ;;
    esac
done
