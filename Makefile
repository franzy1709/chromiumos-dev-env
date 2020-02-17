DOCKER_COMPOSE = docker-compose
DEV_ENV_RUN = ${DOCKER_COMPOSE} run --rm dev_env
DEV_ENV_RUN_IT = ${DOCKER_COMPOSE} run --rm dev_env

dev-console:
	${DEV_ENV_RUN_IT} bash

get-sources:
	${DEV_ENV_RUN} repo init -g minilayout -u https://chromium.googlesource.com/chromiumos/manifest.git \
										  --repo-url https://chromium.googlesource.com/external/repo.git
	${DEV_ENV_RUN} repo sync



down:
	${DOCKER_COMPOSE} down

clear:
	make down
	docker rmi chromium-os-dev-env_dev_env