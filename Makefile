O := ./build/cmake
# CMAKE := cmake
CMAKE := x86_64-w64-mingw32-cmake

TARGS := $(shell sed -n 's/^\([-a-z]\+\):.*/\1/p' Makefile|sort -u|xargs)
.PHONY: $(TARGS)

all: clean build

# ALSO: colorize output
# gccfilter -c cmake ...
build:
	mkdir -p $(O)
	# $(CMAKE) --version
	# $(CMAKE) -E chdir $(O) $(CMAKE) $(shell pwd)
	cd $(O) && $(CMAKE) $(shell pwd)
	if hash colout; then $(CMAKE) --build $(O) 2>&1 | colout -t cmake | colout -t g++; else $(CMAKE) --build $(O); fi

clean:
	rm -rf ./build

help:
	@echo "Available targets: $(TARGS)"
