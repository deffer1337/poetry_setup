precommit-install:
	pip install pre-commit
	pre-commit install

lint:
	pre-commit run --all-files

poetry_lock:
	docker-compose run --rm --no-deps --volume=${PWD}:${PWD} --workdir=${PWD} app poetry lock --no-update
	sudo chown -R ${USER} ./poetry.lock

isort:
	docker-compose run --rm --no-deps --volume=${PWD}:${PWD} --workdir=${PWD} app isort .

flake8:
	docker-compose run --rm --no-deps --volume=${PWD}:${PWD} --workdir=${PWD} app flake8 --config setup.cfg

black:
	docker-compose run --rm --no-deps --volume=${PWD}:${PWD} --workdir=${PWD} app black --config pyproject.toml .

