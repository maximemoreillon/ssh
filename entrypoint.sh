#!/bin/bash

if [[ -z "$SSH_USERNAME" ]]; then
  echo "SSH_USERNAME is not defined"
  exit 2
fi



# Create the user 
useradd -m -s /bin/bash $SSH_USERNAME
echo "Created user $SSH_USERNAME"

# set up the SSH directory
mkdir -p /home/$SSH_USERNAME/.ssh 
chmod 700 /home/$SSH_USERNAME/.ssh
chown -R $SSH_USERNAME:$SSH_USERNAME /home/$SSH_USERNAME/.ssh

# Authorized key
if [ -v SSH_PUBLIC_KEY ]; then
  echo "Registering public key"
  echo $SSH_PUBLIC_KEY > /home/$SSH_USERNAME/.ssh/authorized_keys
fi

# Start the SSH server
/usr/sbin/sshd -D