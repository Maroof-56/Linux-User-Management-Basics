



# Linux User Management Script documentation 

 1. It Allow you to  
       create user 
       add user to group
       set & change user passwdd
       list users
       exit
       
      
   * At start i make a directory and make file in that 
        
        checked file its only wr permission is set 
            - ls -l filename (to check detail )
           
        i change file permission 
            - SUDO CHMOD +X /PATH TO DIRECTORY (U have to  directory to change file permmsion)
            
          When you run chmod, you need to specify which file or directory you are changing permissions for. The path tells the system exactly what to modify.
          
    * Now run the script using ./nameOfFile
    
         U will get 5 option mentioned above 
         
    * 1. ADD USER 
    
          In Script to add user there is script code for that.
          
           create_user(){
              echo "Enter the UserName:"
              read UserName
              sudo useradd $UserName
              echo "User $UserName has been created."
           }

           - CREATE USER 
         
               - sudo useradd -m -s /bin/bash username 

     * 2. ADD USER TO GROUP
           
           add_user_to_group(){
            echo "Enter the username:"
            read UserName
            echo "Enter the group name:"
            read groupname
            sudo usermod -aG $groupname $UserName
            echo "$UserName has been added to $groupname."
           }
           


        - CREATE  Group 
             
               - SUDO GROUPADD GROUP_NAME 
               - CAT /ETC/GROUP    ( TO CHECK NUMBERS OF GROUP )
               - CAT /ETC/GROUP | GREP GRUOP_NAME   (TO SPECIFIY CHECK)
               
               
        - ADD USER TO GROUP (U CANT REMOVE USER FROM ITS PRIMARY GRP)
         
               - SUDO USERMOD -g GROUP_NAME USER_NAME  ( This is the users primary group u can change its PG using same command ).
               - SUDO GPASSWD -A USER_NAME GRP (USING THIS CAN ASLO ADD USER IN GRP AS SECONARY )
               - SUDO USERMOD -G GRP1,GRP2 USER_NAME  ( To Add User in one or more grp )          
               - GROUPS USER_NAME (TO CHECK USERS GROUP )
          
        - DELETE USER FROM GROUP 
                
               - SUDO DELUSER USER_NAME GRP ( USER_NAME FIRST )
               - SUDO GPASSWD -d GROUP_NAME USER_NAME (GRP FIRST)
               - SUDO USERMOD "" USER_NAME  ( TO DELETE USER TO ALL SECONDARY GROUP)
             
        - DELETE GROUP 
               
               - SUDO DELGROUP GRP
               
               
      * 3. CHANGE PASSWD OF USER OR SET 
      
           change_passwd(){

             echo "Enter the username:"
             read UserName
             sudo passwd $UserName 
             echo "Password for $UserName has been updated."
            }
            
        - SET PASSWD FOR  USER 
           
              - PASSWD TO SET PSSWD
              
              - sudo usermod -e YYYY-MM-DD username  ( TO SET ACCOUNT EXPIRY)
              
              - sudo chage -l username  ( TO CHECK ACCNT EXPIRY )

              - sudo chage -E -1 username ( to set  account expiry to never )
               
              - sudo usermod -L username    ( TO LOCK USER | -U TO UNLOCK )


         - SWITCH TO USER 
         
              - SU - USERNAME (  TO SWITCH USER )
                  it may get error like below coz of home directory for that user not created
                 (su: warning: cannot change directory to /home/Maroof: No such file or directory)
         - CREATE DIR FOR USER
              
              - sudo mkdir /home/Maroof  ( CREATE HOME DIR MANUALLY )
             
         - After creating the home directory, set the correct ownership for the user Maroof 
              - SUDO CHMOD MAROOF:MAROOF /HOME/MAROOF  (MAROOF IS USER)
      
         - permissions for the home directory 
          
              - SUDO USERMOD 755 /HOME/MAROOF (FULL ACCESS)
              
         - AFTER THAT WHEN U SWITCH USER IT WILL DISPLAY TERMINAL WITH  $ ONLY THAT MEANS THERE IS NO .BASHRC FILE AVAILBLE & also bcoz of below reason SO I CREATED THAT IT USING
             
             REASON :
                  - The default shell prompt for the user Maroof might not be set to include the username or hostname. If the PS1 variable (which defines the prompt format) is not configured correctly, the prompt may show as just $, or it might be set to a very minimal format.
,
            - .bashrc file
            
              - NANO ~/.BASHRC   (ENTER IN & PASTE BELOW file)
              
            # ~/.bashrc: executed by bash(1) for non-login shells.

            # If not running interactively, don't do anything
            [ -z "$PS1" ] && return

            # Set the default prompt
            export PS1="\u@\h:\w\$ "

            # Enable color support of ls and also add handy aliases
           if [ -x /usr/bin/dircolors ]; then
           test -r ~/.dircolors && eval "$(dircolors ~/.dircolors)"
           alias ls='ls --color=auto'
           alias grep='grep --color=auto'
           alias fgrep='fgrep --color=auto'
           alias egrep='egrep --color=auto'
           fi

           # Custom aliases can be added here

        - Aftr that when you run below 
              - \u@\h:\w$ echo $SHELL
                /bin/sh     ( This is the output  of above command means ur using sh shell )
                 
              - the sh shell has limited command features unlike bash has 
                
              - to use full feature type bash 
               
              - FROM NOW U WILL SEE UR TERMINAL WITH VIEW OF UR USERNAME IS  DISPLAYED 
              -

              
      * 4. LIST USER 
       
           list_users(){
            echo "List of users in the system:"
            cut -d: -f1 /etc/passwd             (etc/passwd file contains all users info)
}

      - Explantion of last line 
      
          - cut:
             This is a command-line utility used to extract sections from each line of input.
             
          -d::
             This option specifies the delimiter that separates fields in the input data. In this case, the delimiter is : (colon).
The /etc/passwd file contains user information, and fields in this file are separated by colons.

          -f1:

             This option specifies which field to extract from the input. -f1 means "the first field."

          -  EXAMPLE  
          
              root:x:0:0:root:/root:/bin/bash
              user1:x:1001:1001:User One:/home/user1:/bin/bash
              user2:x:1002:1002:User Two:/home/user2:/bin/bash
              
          - Ouptut 
          
                root
                user1
                user2


       * 5. TO RUN ABOVE PROGRAM
        
        
           while true; do
           echo "Select an option:"
           echo "1. Create User"
           echo "2. Add User to Group"
           echo "3. Change User Password"
           echo "4.  List Users"
           echo "5. Exit"
             read choice

     case $choice in 
       1) create_user ;;
       2) add_user_to_group ;;
       3) change_passwd ;;
       4) list_users ;;
       5) exit ;;
       6) echo "Invalid option. Try again." ;;
       esac              (means end of case statement)



## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.
