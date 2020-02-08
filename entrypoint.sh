#!/bin/sh
set -e

args="--regex --json --max_depth=500" # Default trufflehog options

if [ -n "${INPUT_SCANARGUMENTS}" ]; then
  args="${INPUT_SCANARGUMENTS}" # Overwrite if new options string is provided
fi

mkdir -p /$GITHUB_WORKSPACE/Reports

java -jar /tmp/oasd.jar $GITHUB_WORKSPACE -json -output-file=$GITHUB_WORKSPACE/Reports/RawOutput.json
jq . $GITHUB_WORKSPACE/Reports/RawOutput.json > $GITHUB_WORKSPACE/Reports/FormatedOutput.json

java -jar /tmp/oasd.jar $GITHUB_WORKSPACE -full-json -output-file=$GITHUB_WORKSPACE/Reports/FullJsonOutput.json
jq . $GITHUB_WORKSPACE/Reports/FullJsonOutput.json > $GITHUB_WORKSPACE/Reports/FormatedFullJsonOutput.json