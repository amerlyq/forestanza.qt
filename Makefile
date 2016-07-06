O := ./build/cmake

TARGS := $(shell sed -n 's/^\([-a-z]\+\):.*/\1/p' Makefile|sort -u|xargs)
.PHONY: $(TARGS)

all: clean build

# ALSO: colorize output
# gccfilter -c cmake ...
build:
	mkdir -p $(O)
	cmake -E chdir $(O) cmake $(shell pwd)
	if hash colout; then cmake --build $(O) 2>&1 | colout -t cmake | colout -t g++; else cmake --build $(O); fi

clean:
	rm -rf ./build

help:
	@echo "Available targets: $(TARGS)"
