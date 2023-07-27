#!/bin/sh

set -x

pkgver=1.31.r27.g5ffd89c
cd /opt/drakon-editor/$pkgver/ada && exec ../drakon_editor.tcl "$@"
