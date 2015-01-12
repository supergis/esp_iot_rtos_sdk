#!/bin/bash

export PATH=/home/supermap/OpenThings/esp-open-sdk/xtensa-lx106-elf/bin:$PATH
make

APPOUT="./app/.output/eagle/debug/image/eagle.app.v6.out"

esptool -eo $APPOUT -bo ./bin/0x00000.bin -bs .text -bs .data -bs .rodata -bc -ec
esptool -eo $APPOUT -es .irom0.text ./bin/0x40000.bin -ec

