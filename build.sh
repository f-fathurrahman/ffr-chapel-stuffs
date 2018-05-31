#!/bin/bash
basn=`basename $1 .chpl`

#ldc2 $1
chpl $1
mv "$basn" "$basn.exe"

