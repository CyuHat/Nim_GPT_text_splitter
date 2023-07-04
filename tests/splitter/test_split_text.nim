import os
import .. / .. / src / text_splitter

proc initializePlayground() =
  os.copyFile("tests/splitter/src/fichier.txt", "fichier.txt")
  os.copyFile("tests/splitter/src/hello_world.txt", "hello_world.txt")
  os.copyFile("tests/splitter/src/empty_file.txt", "empty_file.txt")

proc clearPlayground() =
  os.removeFile("fichier.txt")
  os.removeFile("hello_world.txt")
  os.removeFile("empty_file.txt")

initializePlayground()

let
  res1 = (splitText("Hello wolrd", 5) == @["Hello", " wolr", "d"])
  res2 = (splitText("", 5) == @[])
  res3 = (splitText("Hello world", 0) == @[])

doAssert res1
doAssert res2
doAssert res3

clearPlayground()
