
module Histogram where

import Data.Vector.Unboxed qualified as V

type HistVect = V.Vector Int

type MinVal = Int
type MaxVal = Int
type Hist = (MinVal, MaxVal, HistVect)

computeHist :: [Double] -> Hist
computeHist l = (0, 0, V.empty)     -- TODO

testData :: [Double]
testData = [1.3, 3.7, 4.2, 1.4]

