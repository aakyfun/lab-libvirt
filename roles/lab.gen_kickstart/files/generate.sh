#!/bin/bash

cd $(dirname "${0}")
OUTFILE="${1}"
TMPDIR="mnt"
KSFILE="ks.cfg"
FINALDEST="/tmp/lab-images"

# Make needed directories
mkdir -p ${FINALDEST}
mkdir -p ${TMPDIR}

main () {
  # Create a RAW guest disk image
  qemu-img create -f raw ${OUTFILE} 10M

  # Format as VFAT Filesystem on guest disk image
  mkfs.vfat ${OUTFILE}
 
  # Label Filesystem as OEMDRV
  fatlabel ${OUTFILE} OEMDRV

  # You need libguestfs packages installed!
  guestmount -a ${OUTFILE} -m /dev/sda --rw ${TMPDIR}

  # Copy kickstart file
  cp ${KSFILE} ${TMPDIR}/ks.cfg

  # Unmount the guest disk image
  guestunmount ${TMPDIR}

  # Don't ask me why I need this wait here
  sleep 5
}

main >&2

# Copy kickstart disk image to /tmp
cp ${OUTFILE} ${FINALDEST}
  
# Remove directory so its ready for next time
rm -rf ${TMPDIR}

echo "${FINALDEST}/${OUTFILE}"
