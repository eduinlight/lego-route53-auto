docker-login:
	@docker login -u eduinlight

publish-latest:
	@docker push eduinlight/lego-route53-auto:latest
