module AllTests where

import ElmTest.Assertion (..)
import ElmTest.Test (..)

import JsDiffTest

all = Suite "JsDiff"
  [ JsDiffTest.suite
  ]
