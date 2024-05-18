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
# cek ip
bash /data/data/com.termux/files/ip.sh

EOF

cat << EOF > /data/data/com.termux/files/ip.sh
#!/bin/sh
# Menjalankan ifconfig dan menyimpan outputnya dalam variabel
output=$(ifconfig)

# Mencari baris yang mengandung kata "inet" (alamat IP)
ip_lines=$(echo "$output" | grep "inet ")

# Mencetak alamat IP dari setiap baris
echo "Alamat IP pada perangkat ini:"
echo "$ip_lines" | while read -r line; do
    # Memisahkan baris menjadi kata-kata
    words=($line)
    # Mengambil IP dari kata kedua
    ip=${words[1]}
    # Mencetak IP
    echo "-code-server run in http://$ip:2121"
done
EOF
# -----//

echo "kini anda dapat menjalankan code-server cuku ketik command 'vs' dan kemudiab enter";
