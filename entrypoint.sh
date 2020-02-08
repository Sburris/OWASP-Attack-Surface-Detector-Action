#!/bin/sh
set -e

mkdir -p $INPUT_REPORTLOCATION

java -jar /tmp/oasd.jar $GITHUB_WORKSPACE -json -output-file=$INPUT_REPORTLOCATION/RawOutput.json
jq . $INPUT_REPORTLOCATION/RawOutput.json > $INPUT_REPORTLOCATION/FormatedOutput.json

java -jar /tmp/oasd.jar $GITHUB_WORKSPACE -full-json -output-file=$INPUT_REPORTLOCATION/FullJsonOutput.json
jq . $INPUT_REPORTLOCATION/FullJsonOutput.json > $INPUT_REPORTLOCATION/FormatedFullJsonOutput.json