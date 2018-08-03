import random, sequtils

randomize()

const
  allowedChars = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0987654321"
  specialChars = "~!@#$%^&*()_+-=|{}[]\\/';:"


proc generate(length: int): untyped=
  var password = ""

  for i in 0..length:
    password.add(allowedChars[rand(allowedChars.len())])

  echo password

generate(16)