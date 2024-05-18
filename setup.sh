#!/bin/sh
# update package
pkg update && pkg upgrade -y
# install tor repo
pkg install tur-repo -y
# install code-server
pkg install code-server -y
# install openssl
pkg install openssl -y
# setup comman# create started
cat << EOF > /data/data/com.termux/files/usr/bin/vs
#!/bin/sh
nohup code-server --bind-addr 0.0.0.0:2121 --auth none --cert >/dev/null 2>&1 &
EOF

echo "kini anda dapat menjalankan code-server cuku ketik command 'vs' dan kemudiab enter";
