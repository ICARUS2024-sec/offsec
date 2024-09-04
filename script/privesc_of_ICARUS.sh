#!/bin/bash


echo -e "\u001b[34mWelcome to ICARUS's privilege escalation tool\u001b[0m"

echo -e "\u001b[31mPlease Select\u001b[0m"

select select in "Manuel" "Auto"
do
    case $select in
        "Manuel" )
            PS3="Select an option: "
            select select2 in "Hostname" "Kernel Information" "Distribution Information" "Running Processes" "Environment Variables" "Sudo Version" "Sudo List" "Passwd File" "Network Information" "Listening Ports" "Suid Files" "Export Files" "Capabilities" 
            do
                case $select2 in
                    "Hostname" )
                        echo "$HOSTNAME";;

                    "Kernel Information" )
                        uname -a & cat /proc/version;;

                    "Distribution Information" )
                        cat /etc/issue;;

                    "Running Processes" )
                        ps -A;;

                    "Environment Variables" )
                        env;;

                    "Sudo Version" )
                        sudo -V | head -1;;

                    "Sudo List" )
                        sudo -l 2>/dev/null;;

                    "Passwd File" )
                        cat /etc/passwd 2>/dev/null;;

                    "Network Information" )
                        ifconfig;;

                    "Listening Ports" )
                        netstat -lnput;;

                    "Suid Files" )
                        find / -perm -u=s -type f 2>/dev/null;;

                    "Export Files" )
                        cat /etc/exports 2>/dev/null;;

                    "Capabilities" )
                        getcap -r / 2>/dev/null;;

                    
                        
                        
                    * )
                        echo "Invalid option";;
                esac
            done
            ;;
            

        "Auto" )
            function enum(){

                echo -e "\u001b[34mKernel Information...\u001b[0m"

                sleep 1
                uname -a & cat /proc/version

                echo -e "\033[31m------------------------------\033[0m"

                echo -e "\u001b[34mHostname...\u001b[0m"

                sleep 1
                echo "$HOSTNAME"

                echo -e "\u001b[34mCurrent User Information...\u001b[0m"

                sleep 1
                whoami

                echo -e "\033[31m------------------------------\033[0m"

                echo -e "\u001b[34mAll users with login rights...\u001b[0m"
                sleep 1
                grep -v "nologin" /etc/passwd

                echo -e "\033[31m------------------------------\033[0m"

                echo -e "\u001b[34mSuperusers...\u001b[0m"
                sleep 1
                grep 'x:0:' /etc/passwd

                echo -e "\033[31m------------------------------\033[0m"

                 echo -e "\u001b[34mShadow File(a more authorized user)...\u001b[0m"
                 sleep 1
                 cat /etc/shadow 2>/dev/null

                 echo -e "\033[31m------------------------------\033[0m"

                 echo -e "\u001b[34mHistory...\u001b[0m"
                 sleep 1
                 history 2>7dev/null 

                 echo -e "\033[31m------------------------------\033[0m"
                 
                 echo -e "\u001b[34mSudoers...\u001b[0m"
                 sleep 1
                 cat /etc/sudoers 2>/dev/null

                 echo -e "\033[31m------------------------------\033[0m"

                 echo -e "\u001b[34mHome Directory...\u001b[0m"
                 sleep 1
                 ls /home 

                 echo -e "\033[31m------------------------------\033[0m"

                 echo -e "\u001b[34mCurrent Path...\u001b[0m"
                 sleep 1
                 echo $PATH     

                 echo -e "\033[31m------------------------------\033[0m"

                  echo -e "\u001b[34mCronjobs...\u001b[0m"
                  sleep 1
                  cat /etc/crontab

                  echo -e "\033[31m------------------------------\033[0m"

                  echo -e "\u001b[34mListening Ports...\u001b[0m"
                  sleep 1
                  netstat -lnput

                  echo -e "\033[31m------------------------------\033[0m"

                   echo -e "\u001b[34mRunning Processes...\u001b[0m"
                   sleep 1
                   ps -A

                    echo -e "\033[31m------------------------------\033[0m"

                    echo -e "\u001b[34mSudo Version...\u001b[0m"
                    sleep 1
                    sudo -V | head -1

                    echo -e "\033[31m------------------------------\033[0m"

                    echo -e "\u001b[34mSUID Files...\u001b[0m"
                    sleep 1
                    find / -perm -u=s -type f 2>/dev/null

                    echo -e "\033[31m------------------------------\033[0m"

                    echo -e "\u001b[34mExport Files...\u001b[0m"
                    sleep 1
                    cat /etc/exports 2>/dev/null

                    echo -e "\033[31m------------------------------\033[0m"

                     echo -e "\u001b[34mCapabilities...\u001b[0m"
                     sleep 1
                     getcap -r / 2>/dev/null




            }
                

                
            
            enum
            break
            ;;
            
        * )
            echo "Invalid selection";;
    esac
done
