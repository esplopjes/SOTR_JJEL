#!/bin/bash

sudo /sbin/losetup /dev/loop2 floppy.img
sudo mount -v /dev/loop2 /mnt/floppy
sudo cp -v src/kernel /mnt/floppy/kernel
sudo cp -v initrd.img /mnt/floppy/initrd
sudo cp -v src/grub.cfg /mnt/floppy/grub
sudo umount -v /dev/loop2
sudo /sbin/losetup -d /dev/loop2
