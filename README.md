# term-markdown
A collection of experimental ruby scripts. It makes markdown look good even in a terminal.

![markdown renderer preview](https://raw.githubusercontent.com/cbbuntz/term-markdown/master/data/md_parse.png)

* All standard emphasis styles are correctly displayed.

* Bullet lists and ordered lists are supported

* Horizontal rules, line breaks, and blockquotes also supported

* Includes a generic syntax highlighter

* Experimenting with word wrapping for more consistent rendering

---

## Caveats  
* Headers are differentiated by color instead of size.

* Ordered list are not automatically re-ordered as with most standard renderers. This is a personal preference.

* Superscripts partially supported by using what UTF-8 superscript characters are available (almost all alphanumeric, limited punctuation). Non-monospaced character widths may lead to unpredictable behavior.

* Links and images are given a reference number and displayed after the body of the text, similar to many terminal-based web browsers.

* Table rendering is mangled by non-rendered characters (e.g. escape sequences, emphasis characters). Those characters could be stripped before calculating length or positional the cursor at absolute column with `\e[<n>G1` could rectify this.

* No inline HTML
