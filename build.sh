#!/bin/bash
# Colors
SUCCESS='\033[0;32m'
WARNING='\033[0;33m'
DC='\033[0m'

# Default variable values
version=1.0.2
output_file=""
s_setup=false
s_cmake=false
verbose=false
run=false

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    printf "${WARNING}"
    printf "\n=============================================\n"
    printf "=========== ${DC}HOME-BREW NOT FOUND${WARNING} ===========\n"
    printf "=============================================\n"
    printf "${DC}"
    printf "Please install Homebrew from https://brew.sh/\n"
    exit 1
fi

usage() {
    printf "${SUCCESS}"
    printf "\n\n=============================================\n"
    printf "=============== ${WARNING}BUILD SCRIPT${SUCCESS} ================\n"
    printf "=============================================\n"
    printf "\nUsage: $0 [OPTIONS]\n"
    printf "Options:\n"
    printf " -h, --help      Display this help message.\n"
    printf " -r, --run       Build and run.\n"
    printf " -v, --version   Display script version.\n"
    printf " -E, --skip-env  Skip environment preparation.\n"
    printf " -C, --no-cmake  Skip CMake build file generation.\n"
    printf " -V, --verbose   List the names of commands with category headers while installing.\n\n"
    printf "${DC}"
}

check_and_install() {
    package=$1
    if brew list --versions $package > /dev/null; then
        printf "🔰 ${WARNING}$package is already installed.\n${DC}"
    else
        printf "🔰 ${WARNING}$package is not installed. Installing...\n${DC}"
        if [ "$verbose" = true ]; then
            brew install $package
        else
            brew install $package -q
        fi
    fi
}

setup(){
    printf "${SUCCESS}"
    printf "\n=============================================\n"
    printf "=========== ${DC}PREPARING ENVIRONMENT${SUCCESS} ===========\n"
    printf "=============================================\n"
    printf "${DC}"

    check_and_install "cmake"
}

skip_setup(){
    printf "${WARNING}"
    printf "\n=============================================\n"
    printf "============== ${DC}SKIPPING SETUP${WARNING} ===============\n"
    printf "=============================================\n"
    printf "${DC}"
}

generate(){
    printf "${SUCCESS}"
    printf "\n=============================================\n"
    printf "========== ${DC}GENERATING BUILD FILES${SUCCESS} ===========\n"
    printf "=============================================\n"
    printf "${DC}"

    rm -rf ./build/
    cmake -S ./ -O build/
}

skip_generate(){
    printf "${WARNING}"
    printf "\n=============================================\n"
    printf "====== ${DC}SKIPPING GENERATING BUILD FILES${WARNING} ======\n"
    printf "=============================================\n"
    printf "${DC}"
}

build(){
    printf "${SUCCESS}"
    printf "\n=============================================\n"
    printf "============= ${DC}BUILDING PROJECT${SUCCESS} ==============\n"
    printf "=============================================\n"
    printf "${DC}"

    cd build
    make
}

run() {
    printf "${SUCCESS}"
    printf "\n=============================================\n"
    printf "============== ${DC}RUNNING PROJECT${SUCCESS} ==============\n"
    printf "=============================================\n"
    printf "${DC}"

    ./EMR-System
}

while [ $# -gt 0 ]; do
    case $1 in
        -h | --help)
            usage
            exit 0
            ;;
        -v | --version)
            printf "Build script: $version\n"
            exit 0
            ;;
        -r* | --run)
            run=true
            ;;
        -E* | --skip-env)
            s_setup=true
            ;;
        -B* | --no-cmake)
            s_cmake=true
            ;;
        -V* | --verbose)
            verbose=true
            ;;
        *)
            printf "Invalid option: $1" >&2
            usage
            exit 1
            ;;
    esac
    shift
done

if [ "$s_setup" = true ]; then
    skip_setup
else
    setup
fi

if [ "$s_cmake" = true ]; then
    skip_generate
else
    generate
fi

build

printf "${SUCCESS}"
printf "\n=============================================\n"
printf "============== ${DC}BUILD FINISHED${SUCCESS} ===============\n"
printf "=============================================\n"
printf "${DC}"

if [ "$run" = true ]; then
    run
fi