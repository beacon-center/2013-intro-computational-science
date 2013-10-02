cd /root

pip install screed
pip install ipythonblocks

apt-get -y install lighttpd

if [ \! -f /etc/lighttpd/conf-enabled/10-cgi.conf ]; then
   cd /etc/lighttpd/conf-enabled
   ln -fs ../conf-available/10-cgi.conf ./
   echo 'cgi.assign = ( ".cgi" => "" )' >> 10-cgi.conf
   echo 'index-file.names += ( "index.cgi" ) ' >> 10-cgi.conf
   /etc/init.d/lighttpd restart
fi

pip install -U ipython
pip install -U ipython
pip install -U pyzmq

cd /usr/local/notebooks
rm *.ipynb
curl -O https://raw.github.com/beacon-center/2013-intro-computational-science/master/notebooks/class1-ipythonblocks.ipynb

cd /usr/local/share
curl -O http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.10.1.zip
unzip fastqc_v0.10.1.zip
chmod +x FastQC/fastqc

cd /root
curl -O http://athyra.idyll.org/~t/100k_1.fq
curl -O http://athyra.idyll.org/~t/100k_2.fq

mkdir /var/www/fastqc
/usr/local/share/FastQC/fastqc 100k_1.fq 100k_2.fq -o /var/www/fastqc

#shutdown -r now
