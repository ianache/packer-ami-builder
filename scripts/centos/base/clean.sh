#!/bin/bash

dd if=/dev/zero of=/zeros bs=1M
rm -rf /opt/tmp/*
rm -f /zeros