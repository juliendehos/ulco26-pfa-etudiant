module HistogramSpec (main, spec) where

import Data.Vector.Unboxed qualified as V
import Test.Hspec

import Histogram

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    describe "computeHist [1]" $ do
        let xs = [1.1]
            (minval, maxval, histvect) = computeHist xs
        it "minval" $ minval`shouldBe` 1
        it "maxval" $ maxval`shouldBe` 1
        it "histvect" $ V.toList histvect`shouldBe` [1]

    describe "computeHist [1.3, 3.7, 4.2, 1.4]" $ do
        let xs = testData
            (minval, maxval, histvect) = computeHist xs
        it "minval" $ minval`shouldBe` 1
        it "maxval" $ maxval`shouldBe` 4
        it "histvect" $ V.toList histvect`shouldBe` [2, 0, 1, 1]

