import os, strutils, system

# Check if the chunk of word exceed the max length
proc word_exceed_chunk(word: string, currentChunk: var string, maxLength: int): bool =
  var space = 1
  if currentChunk.len == 0:
    space = 0
  return currentChunk.len + word.len + space > maxLength

# 
proc add_word_to_chunk(word: string, currentChunk: string): string =
  var space: string = " " 
  if currentChunk.len == 0:
    space = ""
  return currentChunk & space & word

proc word_too_long(words: seq[string], maxLength: int): bool =
  var res = false
  for word in words:
    if word.len > maxLength:
      res = true
      break
  return res

proc get_longest_word(words: seq[string]): string =
  var longest = ""
  for word in words:
    if word.len > longest.len:
      longest = word
  return longest

# Creating a function for text splitting
proc splitText*(text: string, maxLength: int): seq[string] =
  var chunks: seq[string] = @[]
  var words = text.split(" ")
  var currentChunk: string = ""

  if word_too_long(words, maxLength):
      echo "One or more words are too long. Try to increase the max length"
      var longest_word = get_longest_word(words)
      echo "Recommended minimal size: " & longest_word.len.intToStr
      quit(QuitFailure)

  # Add words to the chunck if it doesn't exceed the maximum length defined beforehand
  # When the chunck si complet it add it to the chunck list, then it create a new chunck
  for word in words:
    if not word_exceed_chunk(word, currentChunk, maxLength):
      currentChunk = add_word_to_chunk(word, currentChunk)
    else:
      # create a new chunk
      chunks.add(currentChunk)
      currentChunk = word

      # if currentChunk.len > 0:
        # currentChunk.add(" ")
      # currentChunk.add(word)
    # else:
      # chunks.add(currentChunk)
      # currentChunk = word

  if currentChunk.len > 0:
    chunks.add(currentChunk)

  return chunks


# Main function
proc main() =
  let inputFile = "input.txt"
  let outputFile = "output.txt"
  let maxLength = 8000

  # Check if the file exist befor starting the work
  if fileExists(inputFile):
    let text = readFile(inputFile)
    let chunks = splitText(text, maxLength) # Using the function created before

    # Remove the old output file to be replaced
    if fileExists(outputFile):
      removeFile(outputFile)

    # Initial message for the Prompt
    var 
      final_text: seq[string] = @["""Work as a file loader, it means you need to store and recall the contents of the next chunks of text I will provide you.
Each chunk start with -----[START x/TOTAL]----- and its end by -----[END x/TOTAL]-----, where x represents the current segment number and TOTAL is number representing the total number of segments to be loaded. 
For each chunk loaded respond only with "[CHUNK x/TOTAL] Done!" and refrain from providing any explanations or additional comments on the text. 
When the last chunk that end with "-----[END x/TOTAL]-----" where x is equal to TOTAL is loaded, respond "The whole document is loaded please give it a name". Then the user will write "name: TEXT" where TEXT is the name provided.
Then you will respond "Thank you TEXT memorized" and you will memorize the previous chunck as part of a file of name "TEXT" which is the name previously loaded. Then the user can latter use the name to ask specific question about this file."""]

    let max_chunk = chunks.len

    # Create the chunck wrapper
    for i, chunk in chunks:
      var id: int = i + 1
      final_text.add("\n\n" & "-----[" & "START " & $id & "/" & $max_chunk & "]-----" & "\n\n" & chunk & "\n\n" & "-----[" & "END " & $id & "/" & $max_chunk & "]-----" & "\n" & "Do not respond!" & "\n")

    # Open file and write into it
    var final_file = open(outputFile, fmWrite)

    for chunk in final_text:
      final_file.writeLine(chunk)

    final_file.close()

    echo "Created " & outputFile
  else:
    echo "Error: File not found."

# should take a file name and say if it's file extension is correct (in this case ".txt" is correct) 
proc isValidExtension*(file_name: string): bool =
  file_name.split(".")[1] == "txt"

# should take a file name and check if this file is empty or not
proc fileEmpty*(file_name: string): bool = 
  let fileSize = getFileSize(file_name)
  return fileSize == 0

# should remove the first element (in the left) of the text sequence and send it to the clipboard returning the rest
proc copy*(text_sequence: seq[string]): seq[string] = @[]

# Run the whole code
if isMainModule:
  # main()
  echo splitText("Hello World", 5)
