import httpclient, os

const imageUrl = "https://thispersondoesnotexist.com"

proc fetchImage*(): seq[byte] =
  let client = newHttpClient()
  # let image = getContent(client, imageUrl)
  let image = cast[seq[byte]](getContent(client, imageUrl))
  if image.len == 0:
    raise newException(IOError, "empty image received from api")
  image

proc saveImage*(image: seq[byte], filepath: string) =
  writeFile(filepath, image)
