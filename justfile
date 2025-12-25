default:
	@just --list

generate_venv:
	@echo Check if virtualenv exists in this directory
	@test -d .venv || python3 -m venv .venv
	@. .venv/bin/activate; pip install ansible

list-tags: generate_venv
	. .venv/bin/activate; ansible-playbook -i inventory laptop.yml --list-tags

configure-system:
	. .venv/bin/activate; ansible-playbook -i inventory laptop.yml --tags "system,neovim"
