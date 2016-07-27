#!/bin/sh

#️ arg 1
PROFILE="default"
if [ "$1" != "" ] ; then
  PROFILE="$1"
fi
# arg 2
REGION="ap-northeast-1"
if [ "$2" != "" ] ; then
  REGION="$2"
fi
