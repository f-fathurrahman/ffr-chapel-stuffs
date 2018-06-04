#!/bin/bash
basn=`basename $1 .chpl`

chpl $1 $2 -o "$basn.exe"

