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
      diffWords "b\nc" "b1 \nxxx\n"
      `assertEqual`
      [ Added "b1"
      , Removed "b"
      , NoChange " \n"
      , Added "xxx\n"
      , Removed "c"
      ]
  , test "diffWordsWithSpace" <|
      diffWordsWithSpace "b\nc" "b1 \nxxx\n"
      `assertEqual`
      [ Added "b1 \nxxx"
      , Removed "b"
      , NoChange "\n"
      , Removed "c"
      ]
  , test "diffSentences" <|
      diffSentences "b c. a." "b1. a."
      `assertEqual`
      [ Added "b1."
      , Removed "b c."
      , NoChange " a."
      ]
  ]
