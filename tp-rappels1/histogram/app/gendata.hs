import Control.Monad
import System.Random.MWC
import System.Random.MWC.Distributions

main :: IO ()
main = do

  withSystemRandomST (replicateM 1000 . normal 5 3)
    >>= writeFile "normal.txt" . unlines . map show

  withSystemRandomST (replicateM 1000 . uniformRM (5, 15::Double))
    >>= writeFile "uniform.txt" . unlines . map show

