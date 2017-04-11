test:
	@echo "--> Running Python tests"
	tox
	@echo ""

lint:
	@echo "--> Linting Python files"
	PYFLAKES_NODOCTEST=1 flake8 bitfield
	@echo ""

publish:
	python setup.py sdist bdist_wheel upload

.PHONY: test publish
