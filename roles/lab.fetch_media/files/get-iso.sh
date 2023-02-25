#!/bin/bash

# Ensure the script runs in the right place
# for relative paths
cd $(dirname "${0}")

FILENAME="${1}"
ISOURL="${2}"

# Only download a file if it does not exist
# in the iso directory and if the url is provided
main() {
  if [ ! -f ./iso/${FILENAME} ] && [ -n ${ISOURL} ]
  then
    echo Please wait. Downloading ISO...
    curl "${ISOURL}" -o ./iso/${FILENAME} || echo "Missing iso. Provide the download link." && exit 2
  fi

  # Copy the iso to /tmp so libvirt can use it.
  mkdir -p /tmp/lab-images
  cp -nv ./iso/${FILENAME} /tmp/lab-images/
}

main >&2

echo "/tmp/lab-images/${FILENAME}"
