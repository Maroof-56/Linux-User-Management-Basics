
 #!/usr/bin/bash

echo "Welcome to User Mangement Script"

create_user(){
    echo "Enter the UserName:"
    read UserName
    sudo useradd $UserName
    echo "User $UserName has been created."
}

add_user_to_group(){
    echo "Enter the username:"
    read UserName
    echo "Enter the group name:"
    read groupname
    sudo usermod -aG $groupname $UserName
    echo "$UserName has been added to $groupname."
}


change_passwd(){

    echo "Enter the username:"
    read UserName
    sudo passwd $UserName 
    echo "Password for $UserName has been updated."
}

list_users(){
    echo "List of users in the system:"
    cut -d: -f1 /etc/passwd
}

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
       esac
      done
