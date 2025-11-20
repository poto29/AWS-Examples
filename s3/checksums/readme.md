aws s3 mb s3://checksum-example-ap-2904
echo "Hello mars!" > myfile.txt
md5sum myfile.txt -> foloseste etag pe post de checksum

aws s3 cp  myfile.txt s3://checksum-example-ap-2904
aws s3api head-object --bucket checksum-example-ap-2904 --key myfile.txt 

crc32 myfile.txt
# va da: 30302044, valoare in hex
echo "$crc" | xxd -r -p | base64
# pentru valoarea: MDAgRA==, valoare convertita din hex in base64

aws s3api put-object --bucket checksum-example-ap-2904 --key myfilecrc32.txt --body myfile.txt --checksum-algorithm "crc32" --checksum-crc32 "MDAgRA=="
