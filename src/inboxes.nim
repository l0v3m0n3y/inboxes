import asyncdispatch, httpclient, json, uri

proc domain_list*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive","X-Requested-With":"XMLHttpRequest","host": "inboxes.com", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let response = await client.get("https://inboxes.com/api/v2/domain")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc new_email*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive","X-Requested-With":"XMLHttpRequest","host": "inboxes.com", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let response = await client.post("https://inboxes.com/api/v2/inbox", body = "")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()


proc messages_lists*(email:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive","X-Requested-With":"XMLHttpRequest","host": "inboxes.com", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let link="https://inboxes.com/api/v2/inbox/" & email
    let response = await client.get(link)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc delete_email*(email:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive","X-Requested-With":"XMLHttpRequest","host": "inboxes.com", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let link="https://inboxes.com/api/v2/inbox/" & email
    let response = await client.delete(link)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

