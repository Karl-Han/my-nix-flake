PROJECT_NAME ?= "project_template"

rust: 
	cargo new $(PROJECT_NAME)

python: 
	mkdir $(PROJECT_NAME)
	touch $(PROJECT_NAME)/__init__.py