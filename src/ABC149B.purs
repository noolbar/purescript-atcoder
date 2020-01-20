module ABC149B where
  
import Prelude

import Data.Array as Array
import Data.BigInt (BigInt)
import Data.BigInt as BI
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
            , a > k = [(a - k), b]
          | a + b > k 
             = [b0, (a + b - k)]
          | a + b < k = [b0, b0]
          | otherwise = [b0, b0]
        doMatch _ = [b0, b0]
        b0 :: BigInt
        b0 = zero :: BigInt -- Unsafe.unsafePartial (Maybe.fromJust (BI.fromNumber 0.0))
        ao = Unsafe.unsafePartial (Maybe.fromJust $ Array.head $ doMatch (readbint input))
        bo = Unsafe.unsafePartial (Maybe.fromJust $ Array.last $ doMatch (readbint input))
      in
        show $ "  " <> (BI.toString ao) <> " " <> (BI.toString bo) <> "\n"
    
    readbint :: String -> Array BigInt
    readbint input =
      map (\s -> Unsafe.unsafePartial (Maybe.fromJust(BI.fromString s))) (splitBySp input)

