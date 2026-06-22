
import System.Random

import Mcpi1
-- import Mcpi2

main :: IO ()
main = getStdGen >>= print . computePi 100_000

