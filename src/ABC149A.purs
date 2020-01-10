module ABC149A where

import Prelude

import Data.Foldable (foldr)
import Data.String as String
import Effect (Effect)
import Node.Encoding as Encoding
import Node.FS.Sync as FS
import Node.Process as Process
import Node.Stream as Stream

main :: Effect Unit
main = do
  input <- FS.readTextFile Encoding.UTF8 "/dev/stdin"
  void $ Stream.writeString Process.stdout Encoding.UTF8 (solve input) (pure unit)
  pure unit
  where
    splitBySp :: String -> Array String
    splitBySp = String.split (String.Pattern " ")
  
    solve :: String -> String
    solve input = do
      show $ foldr (<>) "" (splitBySp input)
