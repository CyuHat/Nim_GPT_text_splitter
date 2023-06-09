import os, strutils

proc splitText(text: string, maxLength: int): seq[string] =
  var chunks: seq[string] = @[]
  var words = text.split(" ")
  var currentChunk = ""

  for word in words:
    if currentChunk.len + word.len + 1 <= maxLength:
      if currentChunk.len > 0:
        currentChunk.add(" ")
      currentChunk.add(word)
    else:
      chunks.add(currentChunk)
      currentChunk = word

  if currentChunk.len > 0:
    chunks.add(currentChunk)

  return chunks

proc main() =
  let inputFile = "input.txt"
  let outputFile = "output.txt"
  let maxLength = 8000

  if fileExists(inputFile):
    let text = readFile(inputFile)
    let chunks = splitText(text, maxLength)

    if fileExists(outputFile):
      removeFile(outputFile)

    var final_text: string
    let max_chunk = chunks.len

    for i, chunk in chunks:
      var id: int = i + 1
      final_text = final_text & "\n\n" & "-----[" & "START " & $id & "/" & $max_chunk & "]-----" & "\n\n" & chunk & "\n\n" & "-----[" & "END " & $id & "/" & $max_chunk & "]-----"
    #   before_text = 
    writeFile(outputFile, final_text)

    echo "Created " & outputFile
  else:
    echo "Error: File not found."

main()