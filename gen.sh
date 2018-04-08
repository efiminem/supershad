#!/bin/sh
name=$1
#cat $name
#name="/home/vlad/Doc/supershad/source/20-05-2017/4/solution 1.tex"
sed -r 's/([^$]|^)\${1}([^$]+)\${1}/\1<script type="math\/tex">\2<\/script>/g' "$name" | sed -r 's/([^$]|^)\${2}([^$]+)\${2}/<script type="math\/tex; mode=display">\2<\/script>/g'
