import test_playground
import .. / .. / src / text_splitter

discard """
"""

initializePlayground()

doAssert fileEmpty("tests/splitter/src/file.txt") == false
doAssert fileEmpty("tests/splitter/src/empty_file.txt") == true

# echo fileEmpty("file.txt")
# echo fileEmpty("empty_file.txt")

clearPlayground()
