module Main
  ( main
  ) where

import Prelude

import AtCoder.ABC121.A as ABC121A
import Effect (Effect)
import Effect.Console as Console
import Node.Encoding as Encoding
import Node.FS.Sync as FS

solve :: String -> String
solve = ABC121A.solve

main :: Effect Unit
main = do
  input <- FS.readTextFile Encoding.UTF8 "/dev/stdin"
  output <- pure (solve input)
  Console.log output
