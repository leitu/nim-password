import random, sequtils

randomize()

const
  allowedChars = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0987654321"
  specialChars = "~!@#$%^&*()_+-=|{}[]\\/';:"

var allow = toSeq(allowedChars.items)
var special = toSeq(specialChars.items)

proc toString(str: seq[char]): string =
  result = newStringOfCap(len(str))
  for ch in str:
    add(result, ch)

proc generate(length: int): untyped=
  var password = newSeq[char](length)

  for i in 0..length:
    password.add(allowedChars[rand(allowedChars.len())])

  echo toString(password)

generate(16)