# About
A bash script. Converts [GitHub Flavored Markdown (gfm)](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/about-writing-and-formatting-on-github) to HTML using the [Github API](https://docs.github.com/en/rest/markdown/markdown)

# Usage
```bash
Usage: ./gfm2html.sh [OPTIONS] <input>"
OPTIONS:
--mode    Rendering mode. gfm or markdown. default: gfm
--auth    Github auth access token. default: None
          Unauthenticated requests are rate limited to 60 requests per hour.
--css     Link to a CSS style sheet. default: from cdnjs
```

## Quick Start
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/fdxx/gfm2html/main/gfm2html.sh) input.md > output.html
```

## Support standard input
```bash
echo "**Hi**" | ./gfm2html.sh - > output.html
```

## Custom CSS files
Default usage: [github-markdown-css](https://github.com/sindresorhus/github-markdown-css)

```bash
./gfm2html.sh --css "/path/to/github-markdown.css" input.md > output.html
```

## YAML metadata
Supports the following YAML metadata output to HTML. Add at the beginning of `input.md`
```yaml
---
title: 'Hello World!'
author: fdxx
keywords: 'keywords1, keywords2'
description: 'This is a description.'
---
```

# Dependencies
- curl 
- [ripgrep](https://github.com/BurntSushi/ripgrep) 
- [jq](https://github.com/jqlang/jq) 
- [yq](https://github.com/mikefarah/yq) 
- tr

```bash
# Try installing dependencies from debian.
apt update && apt install curl ripgrep jq yq
```
