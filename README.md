# dvd-rip #

Dead-simple shell script to rip encrypted DVDs to ISO files without hassle or fuss.

(ab)uses mplayer and libdvdcss magic for block decryption.

## Example Usage ##

```
[clockfort@desktop ~]$ ./rip_dvd.sh /dev/sr0 /mnt/local_storage/test.iso
About to rip a DVD at /dev/sr0 to a file at /mnt/local_storage/test.iso, with detected block size of 2048 and detected number of blocks as 1937368, for an approximate total size of 3.69 GB.
Does that sound correct? y
Attempting to decrypt blocks so we can copy them...
libdvdread: Using libdvdcss version 1.2.13 for DVD access
There are 16 titles on this DVD.
There are 1 angles in this DVD title.
libdvdread: Attempting to retrieve all CSS keys
libdvdread: This can take a _long_ time, please be patient
libdvdread: Get key for /VIDEO_TS/VIDEO_TS.VOB at 0x0000011e
libdvdread: Elapsed time 0
libdvdread: Get key for /VIDEO_TS/VTS_01_0.VOB at 0x00003729
libdvdread: Elapsed time 0
libdvdread: Get key for /VIDEO_TS/VTS_01_1.VOB at 0x0000ddd2
libdvdread: Elapsed time 0
libdvdread: Found 1 VTS's
libdvdread: Elapsed time 0
audio stream: 0 format: ac3 (stereo) language: ja aid: 128.
number of audio channels on disk: 1.
Starting actual copy.
2.39GiB 0:03:29 [16.8MiB/s] [11.7MiB/s] [==========================================>                         ] 64% ETA 0:01:54

```
