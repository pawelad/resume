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
Based on [YAAC template].

Changes by [Paweł Adamczak][pawelad].

Source code is available at [GitHub][github resume].

Released under [LPPL Version 1.3c][license].


[docker]: https://docs.docker.com/get-docker/
[github resume]: https://github.com/pawelad/resume
[license]: ./LICENSE
[pawelad]: https://pawelad.me/
[yaac template]: https://github.com/darwiin/yaac-another-awesome-cv
