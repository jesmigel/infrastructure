.PHONEY: build

_PACKER=packer
_VAR=variables.json
_TEMPLATE=ubuntu-1604-base.json

build:
	$(_PACKER) build -var-file $(_VAR) $(_TEMPLATE)