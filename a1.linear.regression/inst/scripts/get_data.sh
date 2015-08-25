mkdir tmp
cd tmp
wget https://s3.amazonaws.com/spark-public/ml/exercises/on-demand/machine-learning-ex1.zip
unzip machine-learning-ex1.zip
cd ..
for i in $(find tmp -name ex1data?.txt); do
  cp $i inst/extdata
done
rm -rf tmp

