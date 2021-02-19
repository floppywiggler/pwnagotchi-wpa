# Navigate to the folder with all your handshakes
# Run command: convertwpa
# Two folders (pmkid/hccapx) will be created with your converted handshakes

mkdir pmkid
mkdir hccapx
FILES=./*
EXT=".pcap"
for f in $FILES
do
if [[ "$f" == *"$EXT"* ]];then
  echo "Processing $f file..."
  FileName=$f
  # take action on each file. $f store current file name
  hcxpcaptool -z ./pmkid/${FileName/.pcap/}.pmkid ./$f
  hcxpcaptool -o ./hccapx/${FileName/.pcap/}.hccapx ./$f
fi
done
