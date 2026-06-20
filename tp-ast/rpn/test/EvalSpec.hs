
module EvalSpec (main, spec) where

import Test.Hspec

epsilon :: Double
epsilon = 0.001

approx :: Double -> Double -> Bool
approx x y = abs (x-y) < epsilon

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

  describe "eval" $ do

    -- it "42" $ TODO
    -- it "4.2" $ TODO
    -- it "20 + 22" $ TODO
    -- it "21 * 2" $ TODO
    -- it "log 42" $ TODO
    -- it "(10 + 11) * 2" $ TODO

    pure ()

