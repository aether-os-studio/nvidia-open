#!/bin/bash
# Invocation: <ld path> <absolute input path> <absolute output path>
outpath=$(realpath "$3")

cd $(dirname "$2")

input_basename=$(basename "$2")
temp_input=${input_basename:2}

cp "$input_basename" "$temp_input"

echo "$1 -r -z noexecstack --format=binary $temp_input -o $outpath"

$1 -r -z noexecstack --format=binary "$temp_input" -o "$outpath"

rm "$temp_input"
