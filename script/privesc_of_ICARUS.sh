#!/bin/bash

echo -e "\u001b[34mWelcome to ICARUS's privilege escalation tool\u001b[0m"
echo -e "\u001b[31mPlease Select\u001b[0m"

select option in "Manual" "Auto"; do
    case $option in
        "Manual" )
            PS3="Select an option: "
            select sub_option in "Hostname" "Kernel Information" "Distribution Information" "Running Processes" "Environment Variables" "Sudo Version" "Sudo List" "Passwd File" "Network Information" "Listening Ports" "Suid Files" "Export Files" "Capabilities" "Find id_rsa files"; do
                case $sub_option in
                    "Hostname" ) echo "$HOSTNAME";;
                    "Kernel Information" ) uname -a; cat /proc/version;;
                    "Distribution Information" ) cat /etc/issue;;
                    "Running Processes" ) ps -A;;
                    "Environment Variables" ) env;;
                    "Sudo Version" ) sudo -V | head -1;;
                    "Sudo List" ) sudo -l 2>/dev/null;;
                    "Passwd File" ) cat /etc/passwd 2>/dev/null;;
                    "Network Information" ) ifconfig;;
                    "Listening Ports" ) netstat -lnput;;
                    "Suid Files" ) find / -perm -u=s -type f 2>/dev/null;;
                    "Export Files" ) cat /etc/exports 2>/dev/null;;
                    "Capabilities" ) getcap -r / 2>/dev/null;;
                    "Find id_rsa files" ) ls -la ~/.ssh 2>/dev/null;;
                    * ) echo "Invalid option";;
                esac
            done
            ;;
        "Auto" )
            function enum() {
                local info=(
                    "Kernel Information: uname -a; cat /proc/version"
                    "Hostname: echo \$HOSTNAME"
                    "Current User Information: whoami"
                    "All users with login rights: grep -v 'nologin' /etc/passwd"
                    "Superusers: grep 'x:0:' /etc/passwd"
                    "Shadow File: cat /etc/shadow 2>/dev/null"
                    "History: history"
                    "Sudoers: cat /etc/sudoers 2>/dev/null"
                    "Home Directory: ls /home"
                    "Current Path: echo \$PATH"
                    "Cronjobs: cat /etc/crontab"
                    "Listening Ports: netstat -lnput"
                    "Running Processes: ps -A"
                    "Sudo Version: sudo -V | head -1"
                    "SUID Files: find / -perm -u=s -type f 2>/dev/null"
                    "Export Files: cat /etc/exports 2>/dev/null"
                    "Capabilities: getcap -r / 2>/dev/null"
                    "Find id_rsa files: ls -la ~/.ssh 2>/dev/null"
                )
                
                for item in "${info[@]}"; do
                    echo -e "\u001b[34m${item%%:*}...\u001b[0m"
                    eval "${item#*:}"
                    echo -e "\033[31m------------------------------\033[0m"
                    sleep 1
                done
            }

            enum
            break
            ;;
        * )
            echo "Invalid selection";;
    esac
done

