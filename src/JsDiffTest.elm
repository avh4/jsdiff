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
  , test "diffChars" <|
      diffChars "a\nb\nc" "a\nb1\nxxx\n"
      `assertEqual`
      [ NoChange "a\nb"
      , Added "1"
      , NoChange "\n"
      , Added "xxx\n"
      , Removed "c"
      ]
  , test "diffWords" <|
      diffWords "a\nb\nc" "a\nb1\nxxx\n"
      `assertEqual`
      [ NoChange "a\n"
      , Added "b1"
      , Removed "b"
      , NoChange "\n"
      , Added "xxx\n"
      , Removed "c"
      ]
  ]
