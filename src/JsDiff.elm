module JsDiff
  ( diffChars, diffLines
  , Change(..)
  ) where

{-| Provides and Elm interface to the [npm 'diff' module](https://www.npmjs.com/package/diff).

# Types and Constructors
@docs Change

# Diffing text
@docs diffLines

-}

import Native.JsDiff

type Change
  = NoChange String
  | Added String
  | Removed String

{-| Diffs two blocks of text, comparing character by character.
-}
diffChars : String -> String -> List Change
diffChars = Native.JsDiff.diffChars

{-| Diffs two blocks of text, comparing line by line.
-}
diffLines : String -> String -> List Change
diffLines = Native.JsDiff.diffLines
