#!/usr/bin/env sh

# This logic is copied from the drush script

ORIGDIR=$(pwd)
SELF_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P) && SELF_PATH=$SELF_PATH/$(basename -- "$0")

# Resolve symlinks - this is the equivalent of "readlink -f", but also works with non-standard OS X readlink.
while [ -h "$SELF_PATH" ]; do
    # 1) cd to directory of the symlink
    # 2) cd to the directory of where the symlink points
    # 3) Get the pwd
    # 4) Append the basename
    DIR=$(dirname -- "$SELF_PATH")
    SYM=$(readlink $SELF_PATH)
    SELF_PATH=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)/$(basename -- "$SYM")
done
cd "$ORIGDIR"

SELF_DIR=`dirname -- $SELF_PATH`

if [ -d $SELF_DIR/bin ] ; then
	echo "Removing existing bin directory";
	rm -rf $SELF_DIR/bin;
fi
mkdir $SELF_DIR/bin

echo "Downloading drush 5.9";
DRUSH_TMPFILE=`mktemp /tmp/drush.XXXXXXX.tar.gz`;
curl -Ls http://ftp.drupal.org/files/projects/drush-7.x-5.9.tar.gz -o $DRUSH_TMPFILE;
tar -xzC $SELF_DIR/bin -f $DRUSH_TMPFILE drush;
rm $DRUSH_TMPFILE;
echo "Drush downloaded";

mkdir -p $SELF_DIR/bin/share/drush/commands

echo "Downloading Kraftwagen";
git clone git://github.com/kraftwagen/kraftwagen.git $SELF_DIR/bin/share/drush/commands/kraftwagen --quiet;
rm -rf $SELF_DIR/bin/share/drush/commands/kraftwagen/.git
echo "Kraftwagen downloaded";
