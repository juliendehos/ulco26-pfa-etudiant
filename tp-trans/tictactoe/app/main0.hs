
module Main where

import Control.Monad
import System.IO ( hFlush, stdout )
import Text.Read ( readMaybe )

import Tictactoe

fmtCell :: Cell -> Char
fmtCell CellEmpty = '.'
fmtCell CellX = 'X'
fmtCell CellO = 'O'

fmtStatus :: Status -> String
fmtStatus StatusXPlay = "X play"
fmtStatus StatusOPlay = "O play"
fmtStatus StatusXWin = "X win"
fmtStatus StatusOWin = "O win"
fmtStatus StatusTie = "tie"

-- saisit une position à jouer
-- 
-- recommence la saisie tant qu'on n'a pas une position (2 entiers)
-- mais ne vérifie pas que ces deux entiers sont valides (entre 0 et 2)
askMove :: IO Ix2
askMove = do
  putStr "move? "
  hFlush stdout
  input <- getLine
  case map readMaybe (words input) of
    [Just i, Just j] -> pure (i, j)
    _ -> do
        putStrLn "not a move (should be: 'i j')"
        askMove

-- affiche un jeu (plateau, nombre de coups joués, statut)
display :: GameState -> IO ()
display gs = do
  putStrLn ""
  forM_ [0..2] $ \i -> do
      forM_ [0..2] $ \j -> do
          let c = getCell (i, j) gs
          putChar (fmtCell c)
      putStrLn ""
  let n = getNbMoves gs
      s = getStatus gs
  putStrLn $ "nb moves: " ++ show n
  putStrLn $ "status: " ++ fmtStatus s

-- déroule le jeu jusqu'à la fin
run :: GameState -> IO ()
run gs = do
  -- TODO
  pure ()

-- programme principal
main :: IO ()
main = run mkGameState

