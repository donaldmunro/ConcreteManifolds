trap 'rm -rf $TMPDIR' TERM INT
SOURCE=`basename $1 .tex`
echo $SOURCE
TMPDIR="$(mktemp -d --tmpdir=.)"
LATEX=pdflatex
#BIBER=/usr/local/bin/biber
BIBER=biber

cd $TMPDIR
ln -s ../*.tex .
#ln -s ../images
#ln -s ../include
ln -s ../*.bib .
cp ../1x1.png stereo1.png
cp ../1x1.png stereo2.png


rm -rf tmp.* cc.out
#rm -f $SOURCE.pdf $SOURCE.blg $SOURCE.dvi $SOURCE.log $SOURCE.run.xml $SOURCE.toc $SOURCE.bcf $SOURCE.out $SOURCE.aux $SOURCE.bbl
#set -e
echo "========================$LATEX==========================="
$LATEX -file-line-error -halt-on-error -shell-escape -draftmode $SOURCE.tex
if [[ $? -ne 0 ]] ; then
   mv -f $SOURCE.log $SOURCE-error.log
   mv -f $SOURCE.toc $SOURCE-error.toc
   exit 1
fi

echo "======================= Sage ==========================="
sage $SOURCE.sagetex.sage
if [[ $? -ne 0 ]] ; then
   mv -f $SOURCE.log $SOURCE-error.log
   mv -f $SOURCE.toc $SOURCE-error.toc
   echo "Sage compile failed"
   exit 1
fi

#$LATEX -file-line-error -halt-on-error -shell-escape -draftmode $SOURCE.tex
#if [[ $? -ne 0 ]] ; then
#   mv -f $SOURCE.log $SOURCE-error.log
#   mv -f $SOURCE.toc $SOURCE-error.toc
#   exit 1
#fi

echo "=========================biber========================================================================"
$BIBER $SOURCE
if [[ $? -ne 0 ]] ; then
   mv -f $SOURCE.log $SOURCE-error.log
   mv -f $SOURCE.toc $SOURCE-error.toc
   exit 1
fi

echo "========================$LATEX==========================="
$LATEX -file-line-error -halt-on-error -shell-escape $SOURCE.tex
if [[ $? -ne 0 ]] ; then
   mv -f $SOURCE.log $SOURCE-error.log
   mv -f $SOURCE.toc $SOURCE-error.toc
   exit 1
fi

echo "========================$LATEX==========================="
$LATEX -file-line-error -halt-on-error -shell-escape $SOURCE.tex

mv *.log ..
mv *.pdf ..
cd ..
rm -rf $TMPDIR
exit 0
