#!/bin/bash

# Check if a playbook file was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <playbook.yml>"
  exit 1
fi

PLAYBOOK="$1"
HOSTS="$2"

# Check if the file exists
if [ ! -f "$PLAYBOOK" ]; then
  echo "Error: Playbook '$PLAYBOOK' not found."
  exit 2
fi

# Run the Ansible playbook
ansible-playbook -i ./inventory/inventory.yaml "$PLAYBOOK" -l "$HOSTS" --vault-password-file ~/.vault_pass.txt
