# Source: http://clarkgrubb.com/makefile-style-guide
MAKEFLAGS += --warn-undefined-variables
.DEFAULT_GOAL := help

.PHONY: generate
generate: ## Generate resume
	mkdir -p latex.out/
	docker run --rm \
       --volume "$$(pwd):/data" \
       --workdir "/data/src" \
       tinytex:latest -output-directory="../latex.out" en.tex
	cp latex.out/en.pdf Adamczak_Paweł_Resume_EN.pdf

.PHONY: docker-build
docker-build: ## Build Docker image
	docker build -t tinytex:latest .

.PHONY: clean
clean: ## Clean dev artifacts
	rm -rf latex.out/

# Source: https://www.client9.com/self-documenting-makefiles/
.PHONY: help
help: ## Show help message
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {\
	printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
	}' $(MAKEFILE_LIST)
