
version = 3.5.1-1
# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

install-dep: ## install dependencies
	apt-get update && apt-get install -y \
	libapparmor-dev \
	libpoppler-cpp-dev \
	libxml2-dev \
	libssl-dev

install-shiny-addons: ## install shiny addons
	R -e "install.packages(c('shiny', 'rmarkdown', 'shinyjs', 'shinythemes'), repos='https://cran.rstudio.com/')"

install-packages-nlp: ## install nlp packages
	R -e "install.packages(c('tidyverse','wordcloud','tm','quanteda', 'pdftools', 'readtext', 'RSQLite'), repos='https://cran.rstudio.com/')"

install-packages-api: ## install api packages
	R -e "install.packages(c('Rlinkedin','telegram.bot'), repos='https://cran.rstudio.com/')"
	
install: install-shiny-addons install-packages-nlp install-packages-api install-clean ## install all

docker-build: ## build the image
	docker build . -t wagnerpinheiro/docker-shiny-nlp:${version}

docker-push: ## build the image
	docker push wagnerpinheiro/docker-shiny-nlp:${version}