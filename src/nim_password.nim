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

when isMainModule:
  for kind, key, value in getOpt():
    case kind
    of cmdArgument:
      discard
 
    of cmdLongOption, cmdShortOption:
      case key
      of "v":
        echo "version 1"
      of "h":
        echo getAppFilename().extractFilename() & "with -s=numbers has strong encrypte"
      of "s":
        generate(parseInt(value), true)
      of "x":
        generate(parseInt(value), false)
 
    of cmdEnd:
      discard