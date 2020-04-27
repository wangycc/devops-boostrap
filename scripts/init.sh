#!/bin/bash
CUR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INVENTORY_DIR="${CUR_DIR}/../inventory"
PLAYBOOKS_DIR="${CUR_DIR}/../playbooks"

check_inventory() {
	inv_dir=$(dirname $1)
	if [ ! -e "${inv_dir}/group_vars" ]; then
		echo "Inventory directory ${inv_dir} is missing group_vars directory"
		exit 1
	fi
}

ansible_playbook() {
	inventory=$1
	check_inventory ${inventory}
	ansible-playbook -i "$@"
}
