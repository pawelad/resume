# Paweł Adamczak's Resume
LaTeX source code for my resume.

## Usage
As long as [Docker] is installed, generating the PDF should be as easy as running:

```console
$ make docker-build
$ make generate
```

## Makefile
Available `make` commands:

```console
$ make
generate                        Generate resume
docker-build                    Build Docker image
clean                           Clean dev artifacts
help                            Show help message
```

## Authors
Based on [template][friggeri template] by [Adrien Friggeri][friggeri].

Changes by [Paweł Adamczak][pawelad].

Source code is available at [GitHub][github resume].

Released under [MIT License][license].


[Docker]: https://docs.docker.com/get-docker/
[friggeri template]: https://www.overleaf.com/latex/templates/friggeri-cv-template/hmnchbfmjgqh
[friggeri]: https://github.com/friggeri
[github resume]: https://github.com/pawelad/resume
[license]: ./LICENSE
[pawelad]: https://pawelad.me/
