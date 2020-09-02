#!/bin/sh
. $(dirname $0)/path.sh

OCTADIR="octa_$VERSION_BASE"

if [ -f $OCTADIR.orig.tar.gz ]; then
  exit 127
fi

if [ $VERSION_BASE = "8.3" ]; then
  wget -O $OCTADIR.tar.gz 'http://49.212.191.63/phpBB/download/file.php?id=2581&sid=62e37407b95ebf6dbafe6ddfb0c35152'
  mkdir -p $OCTADIR
  tar zxvf $OCTADIR.tar.gz
  tar zxvf INSTALLER83/OCTA8PKG/GOURMET/gourmet_08_linux.tar.gz -C $OCTADIR
  mkdir -p $OCTADIR/GOURMET/bin/linux_64
  mkdir -p $OCTADIR/GOURMET/lib/linux_64
  tar zxvf INSTALLER83/OCTA8PKG/PF_ENGINE/engines_08_linux.tar.gz -C $OCTADIR
  cp -rp INSTALLER83/DOCUMENTS $OCTADIR
  cp -rp INSTALLER83/LICENSE $OCTADIR
  cp -rp INSTALLER83/SCRIPTS $OCTADIR
  tar zxvf INSTALLER83/OCTA8PKG/EXTERNAL_SOFTWARE/jogl-v2.2.4-linux-amd64.tar.gz -C $OCTADIR/GOURMET/lib/linux_64
  rm -rf INSTALLER83
  (cd $OCTADIR; find . -name *.ual | xargs rm -f)
  (cd $OCTADIR; find . -name *_out.udf | xargs rm -f)
  (cd $OCTADIR; find . -name *_uot.udf | xargs rm -f)
  (cd $OCTADIR; find . -name *_ou.udf | xargs rm -f)
  (cd $OCTADIR; find . -name *.bdf | xargs rm -f)
  (cd $OCTADIR; find . -name *.log | xargs rm -f)
  (cd $OCTADIR; rm -f ENGINES/kapsel3.32/Examples/05/aggregate_LE.udf ENGINES/kapsel3.32/Examples/05/aggregate_LE_2.udf)
  (cd $OCTADIR; rm -rf ENGINES/SpaghettiCord)
  (cd $OCTADIR/ENGINES; find . -name bin | xargs rm -rf)
  (cd $OCTADIR/ENGINES; find . -name out | xargs rm -rf)
else
  echo "Error: unknown version"
  exit 127
fi

tar zcvf octa_$VERSION_BASE.orig.tar.gz octa_$VERSION_BASE
rm -rf octa_$VERSION_BASE
