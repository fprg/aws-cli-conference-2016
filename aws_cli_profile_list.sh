#!/bin/sh

cat ~/.aws/credentials|grep "^\[.*\]$"|sed -e "s/^\[//g"|sed -e "s/\]$//g"
