SHELL=/bin/bash

docker-login:
	@docker login -u eduinlight --password-stdin <<< ${DOCKER_HUB_TOKEN}

publish-latest:
	@docker push eduinlight/c-cpp-local-dev
