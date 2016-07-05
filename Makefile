all:
	mkdir -p build
	g++ $(pkg-config --cflags --libs Qt5Widgets) -fPIC -o build/hello src/hello.cpp
