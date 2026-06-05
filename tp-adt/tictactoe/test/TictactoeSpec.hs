module TictactoeSpec (main, spec) where

import Control.Monad
import Test.Hspec

import Tictactoe

main :: IO ()
main = hspec spec

rollout :: [Ix2] -> Maybe Game
rollout = foldM playMove mkGame

spec :: Spec
spec = do

    describe "X win row" $ do
        let Just (_, n, s) = rollout [(1, 1), (0, 0), (1, 0), (2, 0), (1, 2)]
        it "n" $ n`shouldBe` 5
        it "status" $ s`shouldBe` statusXWin

    describe "O win row" $ do
        let Just (_, n, s) = rollout [(2, 2), (1, 1), (0, 0), (1, 0), (2, 0), (1, 2)]
        it "n" $ n`shouldBe` 6
        it "status" $ s`shouldBe` statusOWin

    describe "X win col" $ do
        let Just (_, n, s) = rollout [(1, 1), (0, 0), (0, 1), (0, 2), (2, 1)]
        it "n" $ n`shouldBe` 5
        it "status" $ s`shouldBe` statusXWin

    describe "X win diag1" $ do
        let Just (_, n, s) = rollout [(1, 1), (0, 1), (0, 0), (0, 2), (2, 2)]
        it "n" $ n`shouldBe` 5
        it "status" $ s`shouldBe` statusXWin

    describe "X win diag2" $ do
        let Just (_, n, s) = rollout [(1, 1), (0, 1), (0, 2), (0, 0), (2, 0)]
        it "n" $ n`shouldBe` 5
        it "status" $ s`shouldBe` statusXWin

    describe "X win last move" $ do
        let Just (_, n, s) = rollout [(1,1), (0,0), (1,0), (0,1), (0,2), (2,0), (2,1), (2,2), (1,2)]
        it "n" $ n`shouldBe` 9
        it "status" $ s`shouldBe` statusXWin

    describe "tie" $ do
        let Just (_, n, s) = rollout [(1,1), (0,0), (1,0), (0,1), (0,2), (2,0), (2,1), (1,2), (2,2)]
        it "n" $ n`shouldBe` 9
        it "status" $ s`shouldBe` statusTie


