import os

proc initializePlayground*() =
  os.copyFile("tests/splitter/src/file.txt", "file.txt")
  os.copyFile("tests/splitter/src/hello_world.txt", "hello_world.txt")
  os.copyFile("tests/splitter/src/empty_file.txt", "empty_file.txt")

proc clearPlayground*() =
  os.removeFile("file.txt")
  os.removeFile("hello_world.txt")
  os.removeFile("empty_file.txt")
