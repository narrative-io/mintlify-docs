#!/bin/bash
# Sorts OpenAPI paths by tag and generates MDX documentation files

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_FOLDER="${1:-api-reference/openapi}"

# Sort the OpenAPI paths by tag
"$SCRIPT_DIR/sort-openapi-paths.sh"

# Generate MDX files
echo "Generating MDX files to $OUTPUT_FOLDER..."
bunx @mintlify/scraping@latest openapi-file api-reference/openapi.json -o "$OUTPUT_FOLDER"

echo "Done!"
