import test_playground
import .. / .. / src / text_splitter

discard """
"""

initializePlayground()

doAssert isValidExtension("file.txt") == true
doAssert isValidExtension("not_valid_extension.mp3") == false

clearPlayground()
