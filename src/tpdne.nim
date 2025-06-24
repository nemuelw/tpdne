import httpclient

const imageUrl = "https://thispersondoesnotexist.com"

proc fetchImage*(): seq[byte] =
  let client = newHttpClient()
  client.headers = newHttpHeaders({
    "User-Agent": "tbdne/0.1.0 (Nim)" 
  })
  let image = cast[seq[byte]](getContent(client, imageUrl))
  if image.len == 0:
    raise newException(IOError, "empty image received from api")
  image

proc saveImage*(image: seq[byte], filepath: string) =
  writeFile(filepath, image)
