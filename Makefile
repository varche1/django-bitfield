clean:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

develop:
	@echo "--> Installing dependencies"
	pip install -e .
	pip install "file://`pwd`#egg=django-bitfield[tests]"
	@echo ""

test:
	@echo "--> Running Python tests"
	tox
	@echo ""

lint:
	@echo "--> Linting Python files"
	PYFLAKES_NODOCTEST=1 flake8 bitfield
	@echo ""


publish: clean
	python setup.py sdist
	twine upload dist/*

.PHONY: test publish
