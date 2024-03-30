#!/bin/bash

echo "const ("
for file in files/*; do
    filename=$(basename "$file" .sol)
    identifier=$(echo "$filename" | tr '.' '_' | sed -r 's/(^|_)([a-z])/\U\2/g')
    echo "    File$identifier FileIdentifier = \"$filename\""
done
echo ")"