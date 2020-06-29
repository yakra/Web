#!/usr/bin/env bash
#
# Copy files from working directory of Web repository to the server
#
set -e
shopt -s nullglob
#server=noreaster.teresco.org
basedir=/var/www/html
rootdir=
shieldsdir=
wpteditdir=
otherdirs="user lib devel devel/manual hb css graphs"
while (( "$#" )); do

    if [ "$1" == "--prod" ]; then
	rootdir=tm
    fi

    if [ "$1" == "--test2" ]; then
	rootdir=tmtest2
    fi

    if [ "$1" == "--shields" ]; then
	shieldsdir=shields
    fi
    
    if [ "$1" == "--wptedit" ]; then
	wpteditdir=wptedit
    fi
    
    shift
done

echo "Updating to $server:$basedir$rootdir, directories . $otherdirs $shieldsdir $wpteditdir"
cp *.{php,js,svg,css,png,gif} $basedir$rootdir
for dir in $otherdirs $shieldsdir $wpteditdir; do
    mkdir -p $basedir$rootdir/$dir
    cp $dir/*.{php,js,svg,css,png,gif} $basedir$rootdir/$dir
done
