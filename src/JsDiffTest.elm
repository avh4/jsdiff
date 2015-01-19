module JsDiffTest where

import ElmTest.Assertion (..)
import ElmTest.Test (..)

import JsDiff (..)

suite = Suite "Foo"
  [ test "diffLines" <|
      diffLines "a\nb\nc" "a\nb1\nxxx\n"
      `assertEqual`
      [ NoChange "a\n"
      , Added "b1\nxxx\n"
      , Removed "b\nc"
      ]
  ]
