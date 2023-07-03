import os
import .. / .. / text_splitter

discard """
"""
  # output: "false\ntrue"

proc initializePlayground() =
  os.copyFile("tests/deps/fichier.txt", "fichier.txt")
  os.copyFile("tests/deps/hello_world.txt", "hello_world.txt")
  os.copyFile("tests/deps/empty_file.txt", "empty_file.txt")

proc clearPlayground() =
  os.removeFile("fichier.txt")
  os.removeFile("hello_world.txt")
  os.removeFile("empty_file.txt")

# initializePlayground()

doAssert fileEmpty("file.txt") == false
doAssert fileEmpty("empty_file.txt") == true

# echo fileEmpty("file.txt")
# echo fileEmpty("empty_file.txt")

# clearPlayground()
