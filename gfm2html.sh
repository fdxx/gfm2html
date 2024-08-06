#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 [OPTIONS] <input>"
    echo "OPTIONS:"
    echo "--mode    Rendering mode. gfm or markdown. default: gfm"
    echo "--auth    Github auth access token. default: None"
    echo "          Unauthenticated requests are rate limited to 60 requests per hour."
    echo "--css     Link to a CSS style sheet. default: from cdnjs"
    exit 1;
fi

# Check for required tools
needed_binaries=(curl rg jq yq tr)
missing_binaries=()
for binary in "${needed_binaries[@]}"; do
    if ! which $binary &>/dev/null ; then
        missing_binaries+=($binary)
    fi
done

if [[ ${#missing_binaries[@]} -gt 0 ]] ; then
    echo "You are missing some tools this script requires: ${missing_binaries[@]}"
    exit 1
fi

# Get arguments
GARGS=("$@")
GetArgValue()
{
    local key="$1"
    local defvalue="$2"
    local count=0

    for arg in "${GARGS[@]}"; do
        count=$((count + 1))
        if [[ "$arg" == "$key" ]]; then
            echo "${GARGS[$count]}"
            return
        fi
    done

    echo "$defvalue"
}

MODE=$(GetArgValue "--mode" "gfm")
AUTH=$(GetArgValue "--auth" "")
CSS=$(GetArgValue "--css" "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.6.1/github-markdown.min.css")

if [ -n "$AUTH" ]; then
    AUTH="Authorization: Bearer $AUTH"
fi

# Get yaml meta and data
INPUT=$(cat "${!#}")
META=$(echo "$INPUT" | rg -Ue '^---(?:\r\n|\r|\n)([\S\s]+)?^---(?:\r\n|\r|\n)' -or '$1')
DATA=$(echo "$INPUT" | rg -Uve '^---(?:\r\n|\r|\n)([\S\s]+)?^---(?:\r\n|\r|\n)' -o)

META_TITLE=""
META_AUTHOR=""
META_KEYWORDS=""
META_DESCRIPTION=""

if [ -n "$META" ]; then
    META_TITLE=$(echo "$META" | yq '.title // ""')
    META_AUTHOR=$(echo "$META" | yq '.author // ""')
    META_KEYWORDS=$(echo "$META" | yq '.keywords // ""')
    META_DESCRIPTION=$(echo "$META" | yq '.description // ""')
fi

# If empty, Try setting the first title to META_TITLE.
if [ -z "$META_TITLE" ]; then
    META_TITLE=$(echo "$DATA" | rg -m1 -e '^#+\s(.+)' -or '$1' | tr -d '\r\n')
fi

# Now, create the json data.
DATA=$(jq -n --arg text "$DATA" --arg mode "$MODE" '{text: $text, mode: $mode}')

# Output HTML.
cat <<EOF
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <meta name="author" content="$META_AUTHOR">
  <meta name="keywords" content="$META_KEYWORDS">
  <meta name="description" content="$META_DESCRIPTION">
  <title>$META_TITLE</title>

  <link rel="stylesheet" href="$CSS">
  <style>
    .markdown-body {
      box-sizing: border-box;
      min-width: 200px;
      max-width: 980px;
      margin: 0 auto;
      padding: 45px;
    }

    @media (max-width: 767px) {
      .markdown-body {
        padding: 15px;
      }
    }
  </style>
</head>
<body>
  <article class="markdown-body">
    $(curl -sSL -X POST -H "Accept: application/vnd.github+json" -H "$AUTH" https://api.github.com/markdown -d "$DATA")
  </article>
</body>
</html>
EOF
