#!/bin/sh

pkgver=1.31.r23.g67ffb40
cd /opt/drakon-editor/$pkgver/ada && exec ../drakon_gen.tcl "$@"
