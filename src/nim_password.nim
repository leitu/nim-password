import random, sequtils

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

generate(16, true)