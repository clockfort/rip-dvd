#!/bin/bash

DVD_DEVICE=$1
OUTPUT_FILE=$2
BLOCK_SIZE=`isoinfo -d -i $DVD_DEVICE | grep "Logical block size" | awk '{print $5}'`
NUM_BLOCKS=`isoinfo -d -i $DVD_DEVICE | grep "Volume size is" | awk '{print $4}'`
SIZE_BYTES=`echo "$BLOCK_SIZE*$NUM_BLOCKS" | bc`
SIZE_GB=`echo "scale=2; $SIZE_BYTES/1024/1024/1024" | bc`

echo "About to rip a DVD at $DVD_DEVICE to a file at $OUTPUT_FILE, with detected block size of $BLOCK_SIZE and detected number of blocks as $NUM_BLOCKS , for an approximate total size of $SIZE_GB GB."
read -p "Does that sound correct? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo "Attempting to decrypt blocks so we can copy them..."
mplayer dvd://1 -endpos 1 -vo null -ao null -dvd-device $DVD_DEVICE 2>&1 | grep "There are\|libdvdread\|audio stream\|number of audio channels"

echo "Starting actual copy."
dd if=$DVD_DEVICE bs=$BLOCK_SIZE count=$NUM_BLOCKS | pv -s $SIZE_BYTES -p -t -e -r -a -b | dd bs=$BLOCK_SIZE count=$NUM_BLOCKS of=$OUTPUT_FILE

eject $DVD_DEVICE
