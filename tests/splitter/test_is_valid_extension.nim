import os
import .. / .. / src / text_splitter

discard """
"""

proc initializePlayground() =
  os.copyFile("tests/splitter/src/fichier.txt", "fichier.txt")
  os.copyFile("tests/splitter/src/hello_world.txt", "hello_world.txt")
  os.copyFile("tests/splitter/src/empty_file.txt", "empty_file.txt")

proc clearPlayground() =
  os.removeFile("fichier.txt")
  os.removeFile("hello_world.txt")
  os.removeFile("empty_file.txt")

initializePlayground()

doAssert isValidExtension("file.txt") == true
doAssert isValidExtension("not_valid_extension.mp3") == false

clearPlayground()
