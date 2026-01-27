#!/bin/bash
# Sorts OpenAPI paths alphabetically by the first tag of each path (case-insensitive)

OPENAPI_FILE="api-reference/openapi.json"

jq '
  .paths |= (
    to_entries
    | sort_by(
        ([.value.get.tags[0]?, .value.post.tags[0]?, .value.put.tags[0]?, .value.delete.tags[0]?, .value.patch.tags[0]?] | map(select(. != null)) | first // "") | ascii_downcase
      )
    | from_entries
  )
' "$OPENAPI_FILE" > "$OPENAPI_FILE.tmp" && mv "$OPENAPI_FILE.tmp" "$OPENAPI_FILE"

echo "Sorted paths in $OPENAPI_FILE by tag"
