
import Control.Monad ( forM_ )
import Data.Vector.Unboxed qualified as V
import System.Environment ( getArgs )
import Text.Read ( readMaybe )

import Histogram ( Hist, computeHist )

displayHist :: Int -> Hist -> IO ()
displayHist size (a, b, v) = pure ()    -- TODO

parseArgs :: [String] -> Maybe (String, Int)
parseArgs _ = Nothing   -- TODO

main :: IO ()
main = pure ()  -- TODO

