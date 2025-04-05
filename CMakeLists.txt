cmake_minimum_required(VERSION 3.10)

project(cpp-emr-system)

# C++23 standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(SOURCES
    src/main.cpp
    src/patient.cpp
    )

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/include)

# Executable target
add_executable(EMR-System ${SOURCES})