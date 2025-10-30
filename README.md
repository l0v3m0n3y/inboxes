# inboxes
temp email web api inboxes.com
# Example
```nim
import asyncdispatch, inboxes, json, strformat, strutils

let data = waitFor new_email()
let email = data["inbox"].getStr()
echo email
```
# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
