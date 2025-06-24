import os, unittest
import thispersondoesnotexist

test "fetchImage returns non-empty binary sequence":
  let img = fetchImage()
  check img.len > 0

test "saveImage writes image to disk":
  let img = fetchImage()
  let filepath = "test_image.jpg"

  if fileExists(filepath):
    removeFile(filepath)

  saveImage(img, filepath)

  check fileExists(filepath)
  check getFileSize(filepath) > 0

  removeFile(filepath)
