module TictactoeSpec (main, spec) where

import Control.Monad
import Test.Hspec

import Tictactoe

main :: IO ()
main = hspec spec

rollout :: [Ix2] -> Maybe GameState
rollout = foldM (flip playMove) mkGameState

spec :: Spec
spec = do

    describe "X win row" $ do
        let Just g = rollout [(1, 1), (0, 0), (1, 0), (2, 0), (1, 2)]
        it "n" $ _gsNbMoves g`shouldBe` 5
        it "status" $ _gsStatus g `shouldBe` StatusXWin

    describe "O win row" $ do
        let Just g = rollout [(2, 2), (1, 1), (0, 0), (1, 0), (2, 0), (1, 2)]
        it "n" $ _gsNbMoves g`shouldBe` 6
        it "status" $ _gsStatus g `shouldBe` StatusOWin

    describe "X win col" $ do
        let Just g = rollout [(1, 1), (0, 0), (0, 1), (0, 2), (2, 1)]
        it "n" $ _gsNbMoves g`shouldBe` 5
        it "status" $ _gsStatus g `shouldBe` StatusXWin

    describe "X win diag1" $ do
        let Just g = rollout [(1, 1), (0, 1), (0, 0), (0, 2), (2, 2)]
        it "n" $ _gsNbMoves g`shouldBe` 5
        it "status" $ _gsStatus g `shouldBe` StatusXWin

    describe "X win diag2" $ do
        let Just g = rollout [(1, 1), (0, 1), (0, 2), (0, 0), (2, 0)]
        it "n" $ _gsNbMoves g`shouldBe` 5
        it "status" $ _gsStatus g `shouldBe` StatusXWin

    describe "X win last move" $ do
        let Just g = rollout [(1,1), (0,0), (1,0), (0,1), (0,2), (2,0), (2,1), (2,2), (1,2)]
        it "n" $ _gsNbMoves g`shouldBe` 9
        it "status" $ _gsStatus g `shouldBe` StatusXWin

    describe "tie" $ do
        let Just g = rollout [(1,1), (0,0), (1,0), (0,1), (0,2), (2,0), (2,1), (1,2), (2,2)]
        it "n" $ _gsNbMoves g`shouldBe` 9
        it "status" $ _gsStatus g `shouldBe` StatusTie


