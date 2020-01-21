module ABC149C where

import Prelude

import Data.Array (foldr, range)
import Data.BigInt (BigInt)
import Data.BigInt as BI
import Data.Int (fromString)
import Data.Maybe as Maybe
import Data.String as String
import Effect (Effect)
import Node.Encoding as Encoding
import Node.FS.Sync as FS
import Node.Process as Process
import Node.Stream as Stream
import Partial.Unsafe as Unsafe

main :: Effect Unit
main = do
  input <- FS.readTextFile Encoding.UTF8 "/dev/stdin"
  void $ Stream.writeString Process.stdout Encoding.UTF8 (solve' input) (pure unit)
  pure unit
  where
    splitBySp :: String -> Array String
    splitBySp = String.split (String.Pattern " ")

    solve :: String -> String
    solve input = do
      (BI.toString $ nextPrime (Unsafe.unsafePartial (Maybe.fromJust (BI.fromString input)))) <> "\n"
  
    nextPrime :: BigInt -> BigInt
    nextPrime x =
      case BI.prime x of
        true -> x
        false -> nextPrime (x + (BI.fromInt 1))
        
    solve' :: String -> String
    solve' input = do
      (show $ nextPrime' (Unsafe.unsafePartial (Maybe.fromJust (fromString input)))) <> "\n"

    nextPrime' :: Int -> Int
    nextPrime' x =
      case prime x of
        true -> x
        false -> nextPrime' (x + 1)
        where
          prime :: Int -> Boolean
          prime n 
            | n == 2 = true
            | otherwise =
              let
                r = range 2 (n-1)
                modarry = map (\f -> mod n f /= 0) r
              in foldr (&&) true modarry
