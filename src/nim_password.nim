import os, random, sequtils, parseopt, strutils

randomize()

const
  allowedChars = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0987654321"
  specialChars = "~!@#$%^&*()_+-=|{}[]\\/';:"

var allChars = allowedChars & specialChars

proc generate*(length: int, strong: bool): untyped=
  var password = ""

  for i in 0..length:
    if strong:
      password.add(allChars[rand(allChars.len()-1)])
    else:
      password.add(allowedChars[rand(allowedChars.len()-1)])

  echo password

proc writeHelp() =
  echo getAppFilename().extractFilename() & "with numbers and -s has strong encrypte"
  echo "eg: " & getAppFilename().extractFilename() & " 16 -s"
  echo "eg: " & getAppFilename().extractFilename() & " 16"

proc main() =
  var strong = false
  case paramCount():
    of 1:
      var numbers = parseInt(commandLineParams()[0])
      generate(numbers, strong)
    of 2:
      var numbers = parseInt(commandLineParams()[0])
      if commandLineParams()[1] == "-s":
        strong = true
        generate(numbers, strong)
      else:
        writeHelp()
        quit 1
    else:
      writeHelp()

when isMainModule:
  main()
