cmake_minimum_required(VERSION 3.0.2)
# SEE http://www.kaizou.org/2014/11/typical-cmake-project/

project(forestanza)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/linux/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/linux/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/linux/cache)

# Optionally
set(CMAKE_COLOR_MAKEFILE ON)
set(CMAKE_VERBOSE_MAKEFILE OFF)
# set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE
#     "bash -ec '! hash colout &>/dev/null||exec &> >(colout -t g++);\"$@\"' -- ")

# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
# As moc files are generated in the binary dir, tell CMake
# to always look for includes there
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# set (CMAKE_PREFIX_PATH "C:\\Qt\\Qt5.0.1\\5.0.1\\msvc2010\\")

# Find the QtWidgets library
# Widgets finds its own dependencies (QtGui and QtCore).
find_package(Qt5Widgets REQUIRED)

set(CMAKE_CXX_STANDARD 14)

# Tell CMake to create the helloworld executable
add_executable(hello.bin src/hello.cpp)

# Use the Widgets module from Qt 5.
target_link_libraries(hello.bin Qt5::Widgets)


## Don't link qtmain.lib static library
# add_executable(myexe WIN32 main.cpp)
# target_link_libraries(myexe Qt5::QtGui)

# add_executable(myexe_no_qtmain WIN32 main_no_qtmain.cpp)
# set_property(TARGET main_no_qtmain PROPERTY QT5_NO_LINK_QTMAIN ON)
# target_link_libraries(main_no_qtmain Qt5::QtGui)
