module ABC149B where
  
import Prelude

import Data.BigInt (BigInt)
import Data.BigInt as BigInt
import Data.Foldable (foldr)
import Data.String as String
import Effect (Effect)
import Node.Encoding (Encoding)
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
    solve input =
      let
        doMatch :: Array BigInt -> Array BigInt
        doMatch [a, b, k]
          | a + b > k 
            , a > k = {a: (a - k), b}
          | a + b > k 
            , a < k = {a: 0, b:(a + b - k)}
          | a + b < k = {a:0, b:0}
          | otherwise = {a:0, b:0}
      in do
        {a, b, k} <- readbint input
        show $ foldr (<>) " " (doMatch [a, b, k])
    
    readbint :: String -> Array BigInt
    readbint input = do
      strs <- splitBySp input
      map BigInt.fromString strs
      



