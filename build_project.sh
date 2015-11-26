#! /bin/bash

PARENT_DIR="$(pwd)"

#Add a path to all libraries
MYSENSORS_LIB="libraries/mysensors_github/libraries/MySensors"
DHT_LIB="libraries/mysensors_github/libraries/DHT"
#DHT_LIB="libraries/arduino_github/libraries/DHTlib"

function CHECK_DEPENDENCIES {

  if ! which platformio >/dev/null; then
    echo "Install platfromio!"
    echo "http://platformio.org/#!/get-started"
    exit
  fi

  if [ -n "$DISPLAY" ]; then
    if which arduino > /dev/null; then
      ARDUINO=$(which arduino)
    else
      echo "Install arduino"
      exit
    fi
  else
    if which arduino-headless > /dev/null; then
      ARDUINO=$(which arduino-headless)
    else
      echo "Install arduino-headless"
      echo "Create arduino-headless and copy:"
      echo "
      #!/bin/bash
      Xvfb :1 -nolisten tcp -screen :1 1280x800x24 &
      xvfb=\"$!\"
      DISPLAY=:1 arduino \$@
      kill -9 \$xvfb
      "
      echo "and make arduino-headless runnable (/usr/local/bin/arduino-headless)"
      exit
    fi
  fi
}

###
# List all nodes/gateways that are possible to build
###
function LIST_DIR {

  local i=0
  dirs=( $(find . -maxdepth 1 -type d -printf '%P\n') )
  for dir in "${dirs[@]}"; do
    if [  "${dir}" == ".git" ]; then
      unset dirs[$i]
    elif [ "${dir}" == "libraries" ]; then
      unset dirs[$i]
    fi
    i=$i+1
  done
  dirs=("${dirs[@]}" "Quit")
  echo "Which project do you want to build? "
  select dir in "${dirs[@]}"; do
    if [ "${dir}" == "Quit" ]; then
      echo "Quit"
      break
    elif [[ $REPLY -gt 0 && $REPLY < ${#dirs[@]} ]] ; then
      echo "${dir} selected"
      BUILD_WITH_PLATFORMIO "${dir}"
      #BUILD_WITH_ARDUINO "${dir}"
      LIST_DIR
    else
      echo "Select between 0 and ${#dirs[@]}"
    fi
  done
}

###
# Use the the arduino cli for building.
# TODO: Add interface for build with differnet boards and 8Mhz/16Mhz
###
BUILD_WITH_ARDUINO() {
  LINK_HEADER "${dir}" "arduino"
  ${ARDUINO} --upload -v --board arduino:avr:pro --pref build.f_cpu=8000000 --pref build.mcu=atmega328p --pref compiler.warning_level=all --pref sketchbook.path="${PWD}/${dir}" "${PWD}/${dir}/${dir}.ino"

}

###
# TODO: Platformio dosen't work with MySensors lib.
###
BUILD_WITH_PLATFORMIO() {
  LINK_HEADER "${dir}" "platformio"
  (cd "${1}" && platformio run --target clean)
  (cd "${1}" && platformio run)

  if [ "$?" -ne "0" ]; then
    echo "Compiliing failed "
    echo "Exiting"
    exit
  fi

  read -r -p "Want to upload? [Y/n]" response
  response=${response,,} # tolower
  if [ "${response}" = "" ]; then
    response='yes'
  fi

  if [[ $response =~ ^(yes|y| ) ]]; then
    echo "Upload"
    (cd "${1}" && platformio run --target upload)
  else
    echo "Not upload"
  fi
}

###
# Checks which includes the sketch wants and creates a symlink to
# the lib
# TODO: Platformio dosen't work with MySensors lib.
###
LINK_HEADER() {
  cd "${1}"
  echo "Link_header "

  # Scan the ino file for #include <lib.h>
  if [ "${2}" = "arduino" ]; then
    local header_files=($(grep "include" ./*.ino | sed 's/\(#include <\)\(.*\)\(.h>\)/\2/'))
    lib_dir=libraries
  else
    echo "platformio"
    local header_files=($(grep "include" src/*.ino | sed 's/\(#include <\)\(.*\)\(.h>\)/\2/'))
    lib_dir=lib
  fi

  if [ ! -d "$lib_dir" ]; then
    mkdir "$lib_dir"
  else
    rm -r ${lib_dir}/*
  fi

  for file in "${header_files[@]}"; do
    case $file in
      "MySensor")
        # Fix path to mysensors lib in platformio.ini
        if [ "${2}" = "platformio" ]; then
          sed -i "s:\(build_flags\s*=\)\(.*\):\1 \-I$PARENT_DIR/$MYSENSORS_LIB:" platformio.ini
          cat platformio.ini
        elif [[ ! -d "$lib_dir/${file}" ]]; then
          ln -s "${PARENT_DIR}/${MYSENSORS_LIB}" "$lib_dir/${file}"
        fi
        ;;
      "DHT")
        if [[ ! -d "$lib_dir/${file}" ]]; then
          ln -s "${PARENT_DIR}/${DHT_LIB}" "$lib_dir/${file}"
        fi
        ;;
      *)
        echo "Nothing ${file}"
    esac
  done
  cd "${PARENT_DIR}"
}

CHECK_DEPENDENCIES
LIST_DIR
