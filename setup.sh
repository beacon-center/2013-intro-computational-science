cd /root

pip install screed
pip install ipythonblocks

pip install -U ipython
pip install -U ipython
pip install -U pyzmq
pip install ipythonblocks


cd /usr/local/notebooks
rm *.ipynb
curl -O https://raw.github.com/beacon-center/2013-intro-computational-science/master/notebooks/class3-lists-dicts-functions.ipynb
curl -O https://raw.github.com/beacon-center/2013-intro-computational-science/master/notebooks/class2-ipythonblocks.ipynb
curl -O https://raw.github.com/beacon-center/2013-intro-computational-science/master/notebooks/hw1-ipythonblocks-SOLUTIONS.ipynb
curl -O https://raw.github.com/beacon-center/2013-intro-computational-science/master/notebooks/hw2-ipythonblocks.ipynb

cd /root
curl -O -L http://sourceforge.net/projects/bowtie-bio/files/bowtie/0.12.7/bowtie-0.12.7-linux-x86_64.zip
unzip bowtie-0.12.7-linux-x86_64.zip
cd bowtie-0.12.7
cp bowtie bowtie-build bowtie-inspect /usr/local/bin

cd /mnt

curl -O http://athyra.idyll.org/~t/ecoli-v41.fa
curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR390/SRR390202/SRR390202_1.fastq.gz | gunzip -c | head -800000 > raw-reads.fq
curl https://s3.amazonaws.com/public.ged.msu.edu/SRR390202.pe.qc.fq.gz | gunzip -c | head -800000 > qc-reads.fq

/usr/local/bin/bowtie-build ecoli-v41.fa ecoli-v41
/usr/local/bin/bowtie -p 2 ecoli-v41 -q raw-reads.fq raw-reads.map
/usr/local/bin/bowtie -p 2 ecoli-v41 -q qc-reads.fq qc-reads.map
git clone https://github.com/ngs-docs/ngs-scripts.git /root/ngs-scripts

for i in *-reads.map
do
python /root/ngs-scripts/bowtie/map-profile.py $i > $i.count
done

shutdown -r now
