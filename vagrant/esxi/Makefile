.PHONY: up down clean status config login

_VM=vagrant

clean:
	$(_VM) destroy

config:
	$(_VM) validate

down:
	$(_VM) suspend

login:
	$(_VM) ssh

status:
	$(_VM) status
	
up:
	$(_VM) up
