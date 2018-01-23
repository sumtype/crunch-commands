openssl aes-256-cbc -a -salt -in $1 -out "$1.enc"
shred -n 9 $1
rm -rf $1
