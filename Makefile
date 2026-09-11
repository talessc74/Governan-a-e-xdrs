SHELL := /bin/bash

install:
	npm install

# Build the distributable package tarball
build: install
	npm pack --pack-destination=./dist

# Lint all local XDRS documents (excludes external _core scope)
lint:
	npx xdrs-core lint .

# Lint including external scopes
lint-all:
	npx xdrs-core lint --all .

# Verify managed files are in sync with the distributed package
check:
	npx argus-xdrs-governance check

# Extract governance files into this project (run after npm install)
# NOTE: filedist's real subcommand is "install", not "extract" - "extract"
# is just this target's friendly name.
extract:
	npx argus-xdrs-governance install

clean:
	rm -rf dist node_modules .filedist.lock
