.DEFAULT_GOAL := help

login:## make login bucket=your-bucket
	pulumi login s3://$(bucket)

init:## make init
	pulumi stack init develop --cwd infra

plan:## make plan
	pulumi stack select develop --cwd infra
	pulumi preview --cwd infra

deploy:## make deploy
	pulumi stack select develop --cwd infra
	pulumi up --yes --cwd infra

destroy:## make destroy
	pulumi destroy --cwd infra

HELP_FUN = \
	%help; \
	while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-]+)\s*:.*\#\#(?:@([a-zA-Z\-]+))?\s(.*)$$/ }; \
	print "Usage: make [target]\n\n"; \
	for (sort keys %help) { \
		print "${WHITE}$$_:${RESET}\n"; \
		for (@{$$help{$$_}}) { \
			$$sep = " " x (32 - length $$_->[0]); \
			print "  ${YELLOW}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
		}; \
		print "\n"; \
	}

help:
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)
