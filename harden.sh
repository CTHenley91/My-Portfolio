#!/bin/bash
# T1-M1-S02: SECURITY HARDENING AUTOMATION
# Task: Restore Gold Standard permissions to restricted artifacts.

# TODO: Add commands to secure ~/Vault/secrets.txt to 600
# TODO: Add commands to secure /etc/shadow to 640

 # Task 1: Secure the personnel file (Read=4 + Write=2)

chmod 600 ~/Vault/secrets.txt


# Task 2: Restore the system shadow file (User: 4+2 | Group: 4 | Others: 0)

sudo chmod 640 /etc/shadow 
