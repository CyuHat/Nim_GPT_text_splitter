import .. / .. / src / text_splitter
import test_playground

initializePlayground()

let
  res1 = (splitText("Hello wolrd", 5) == @["Hello", " wolr", "d"])
  res2 = (splitText("", 5) == @[])
  res3 = (splitText("Hello world", 0) == @[])

doAssert res1
doAssert res2
doAssert res3

clearPlayground()
