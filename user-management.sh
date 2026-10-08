#!/bin/bash

# ==========================================
#       USER MANAGEMENT AUTOMATION
# ==========================================

# ------------------------------------------
# Check root privileges
# ------------------------------------------

if [ "$EUID" -ne 0 ]; then
    echo "ERROR: This script must be run as root."
    echo "Use: sudo $0"
    exit 1
fi

# ------------------------------------------
# Create User
# ------------------------------------------

create_user() {

    read -p "Enter username to create: " USERNAME

    if [ -z "$USERNAME" ]; then
        echo "ERROR: Username cannot be empty."
        return 1
    fi

    if id "$USERNAME" &>/dev/null; then
        echo "ERROR: User '$USERNAME' already exists."
        return 1
    fi

    if useradd -m -s /bin/bash "$USERNAME"; then
        echo "User '$USERNAME' created successfully."

        echo
        echo "Set password for $USERNAME:"
        passwd "$USERNAME"

    else
        echo "ERROR: Failed to create user '$USERNAME'."
        return 1
    fi
}

# ------------------------------------------
# Delete User
# ------------------------------------------

delete_user() {

    read -p "Enter username to delete: " USERNAME

    if [ -z "$USERNAME" ]; then
        echo "ERROR: Username cannot be empty."
        return 1
    fi

    if ! id "$USERNAME" &>/dev/null; then
        echo "ERROR: User '$USERNAME' does not exist."
        return 1
    fi

    read -p "Are you sure you want to delete '$USERNAME'? (y/n): " ANSWER

    if [[ "$ANSWER" =~ ^[Yy]$ ]]; then

        if userdel -r "$USERNAME"; then
            echo "User '$USERNAME' deleted successfully."
        else
            echo "ERROR: Failed to delete user '$USERNAME'."
            return 1
        fi

    else
        echo "User deletion cancelled."
    fi
}

# ------------------------------------------
# Check User
# ------------------------------------------

check_user() {

    read -p "Enter username to check: " USERNAME

    if [ -z "$USERNAME" ]; then
        echo "ERROR: Username cannot be empty."
        return 1
    fi

    if id "$USERNAME" &>/dev/null; then

        echo
        echo "User '$USERNAME' exists."
        echo "----------------------------------------"

        id "$USERNAME"

        echo
        echo "Home Directory:"
        getent passwd "$USERNAME" | cut -d: -f6

        echo
        echo "Shell:"
        getent passwd "$USERNAME" | cut -d: -f7

    else
        echo "User '$USERNAME' does not exist."
    fi
}

# ------------------------------------------
# List Users
# ------------------------------------------

list_users() {

    echo
    echo "========================================"
    echo "             SYSTEM USERS"
    echo "========================================"

    cut -d: -f1 /etc/passwd

    echo "========================================"
}

# ------------------------------------------
# Main Menu
# ------------------------------------------

while true
do

    echo
    echo "========================================"
    echo "        USER MANAGEMENT"
    echo "========================================"
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Check User"
    echo "4. List Users"
    echo "5. Exit"
    echo "========================================"

    read -p "Enter your choice: " CHOICE

    case "$CHOICE" in

        1)
            create_user
            ;;

        2)
            delete_user
            ;;

        3)
            check_user
            ;;

        4)
            list_users
            ;;

        5)
            echo "Exiting User Management."
            exit 0
            ;;

        *)
            echo "ERROR: Invalid choice."
            ;;

    esac

done
