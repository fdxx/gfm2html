---
title: 'Hello World!'
author: fdxx
keywords: 'keywords1, keywords2'
description: This is a markdown example website.
---

# Hello World

# Level 1 title
## Level 2 title
### Level 3 title
#### Level 4 title

## Paragraphs
You can create a new paragraph by leaving a blank line between lines of text.

**Markdown** is a lightweight markup language with concise syntax, allowing people to focus more on the content itself rather than the layout. It uses a plain text format that is easy to read and write to write documents, can be mixed with HTML, and can export HTML, PDF, and its own .md format files. Because of its simplicity, efficiency, readability, and ease of writing, `Markdown` is widely used, such as [Github](https://github.com/), Wikipedia, Jianshu, etc.

## Emphasis
I just love **bold text**.
Italicized text is the *cat's meow*.
<ins>Underline</ins> requires `<ins>` HTML syntax 
~~Delete this text.~~
Link to the [github.](https://github.com)

## Quoting text
> **Markdown** is a lightweight markup language with concise syntax, allowing people to focus more on the content itself rather than the layout. It uses a plain text format that is easy to read and write to write documents, can be mixed with HTML, and can export HTML, PDF, and its own .md format files. Because of its simplicity, efficiency, readability, and ease of writing, `Markdown` is widely used, such as [Github](https://github.com/), Wikipedia, Jianshu, etc.

## Lists

### Ordered Lists
1. First item
2. Second item
3. Third item
4. Fourth item
  
### Unordered Lists
- First item
- Second item
- Third item
- Fourth item

### Task lists
- [x] https://github.com/microsoft/vscode/issues/224902
- [ ] Add delight to the experience when all tasks are complete :tada:

## Table
| Left-aligned | Center-aligned | Right-aligned |
| :---         |     :---:      |          ---: |
| git status   | git status     | git status    |
| git diff     | git diff       | git diff      |

## Code blocks

```c++
#include <iostream>

int main(int argc, char *argv[]) {

  /* An annoying "Hello World" example */
  for (auto i = 0; i < 0xFFFF; i++)
    cout << "Hello, World!" << endl;

  char c = '\n';
  unordered_map <string, vector<string> > m;
  m["key"] = "\\\\"; // this is an error

  return -2e3 + 12l;
}
```

```go
package main

import "fmt"

func main() {
    ch := make(chan float64)
    ch <- 1.0e10    // magic number
    x, ok := <- ch
    defer fmt.Println(`exitting now\`)
    go println(len("hello world!"))
    return
}
```

```bash
#!/bin/bash

###### CONFIG
ACCEPTED_HOSTS="/root/.hag_accepted.conf"
BE_VERBOSE=false

if [ "$UID" -ne 0 ]
then
 echo "Superuser rights required"
 exit 2
fi

genApacheConf(){
 echo -e "# Host ${HOME_DIR}$1/$2 :"
}

echo '"quoted"' | tr -d \" > text.txt
```

```json
[
  {
    "title": "apples",
    "count": [12000, 20000],
    "description": {"text": "...", "sensitive": false}
  },
  {
    "title": "oranges",
    "count": [17500, null],
    "description": {"text": "...", "sensitive": false}
  }
]
```

## Footnotes
Here is a simple footnote[^1].

A footnote can also have multiple lines[^2].

[^1]: My reference.
[^2]: To add line breaks within a footnote, prefix new lines with 2 spaces.
  This is a second line.

## Collapsed sections
<details>
<summary>Click to expand</summary>
You can temporarily obscure sections of your Markdown by creating a collapsed section that the reader can choose to expand. For example, when you want to include technical details in an issue comment that may not be relevant or interesting to every reader, you can put those details in a collapsed section.
</details>

## Emoji
😂🤣😡📱🇨🇳😍

## Alerts
> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.

## Images
![](https://img.shields.io/badge/shields-test-blue) ![](https://github.com/fdxx/gfm2html/actions/workflows/gh-pages.yml/badge.svg)

![github](https://myoctocat.com/assets/images/base-octocat.svg)
