#!/bin/bash
MYTEST=RRR
MYTEST1=RRR


waitfordso () {
while  [ $MYTEST != CIAO ]; do
if [ `ls /dev/dso203 | wc -w` -eq 1 ]; then echo DSO ; MYTEST=CIAO ;  fi ;
done
MYTEST=RRR
sleep 1
}

waitfordfu () {
while  [ $MYTEST1 != CIAO ]; do
if [ `ls dfu | wc -w` -eq 0 ]; then echo DFU ; MYTEST1=CIAO ;  fi ;
done
MYTEST1=RRR
sleep 2
}

rm -R dfu
mkdir dfu

if [ -f ${1}A.ADR ]
then
waitfordso
mount /dev/dso203 ./dfu
echo "EXE cp ${1}A.ADR ./dfu && sync"
cp ${1}A.ADR ./dfu && sync
waitfordfu
umount `mount | grep \`pwd\`/dfu | cut -d' ' -f1`
fi
if [ -f ${1}A.BIN ]
then
waitfordso
mount /dev/dso203 ./dfu
echo `ls dfu`
echo "EXE cp ${1}A.BIN ./dfu && sync"
cp ${1}A.BIN ./dfu && sync
waitfordfu
umount `mount | grep \`pwd\`/dfu | cut -d' ' -f1`
fi
if [ -f ${1}B.ADR ]
then
waitfordso
mount /dev/dso203 ./dfu
echo `ls dfu`
echo "EXE cp ${1}B.ADR ./dfu && sync"
cp ${1}B.ADR ./dfu && sync
waitfordfu
umount `mount | grep \`pwd\`/dfu | cut -d' ' -f1`
fi
if [ -f ${1}B.BIN ]
then
waitfordso
mount /dev/dso203 ./dfu
echo `ls dfu`
echo "EXE cp ${1}B.BIN ./dfu && sync"
cp ${1}B.BIN ./dfu && sync
waitfordfu
umount `mount | grep \`pwd\`/dfu | cut -d' ' -f1`
fi
waitfordso
mount /dev/dso203 ./dfu
echo `ls dfu`
waitfordso
umount `mount | grep \`pwd\`/dfu | cut -d' ' -f1`

