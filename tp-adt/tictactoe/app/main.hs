
import Control.Monad ( forM_ )
import System.IO ( hFlush, stdout )
import Text.Read ( readMaybe )

import Tictactoe

-- TODO fmtCell :: Cell -> Char

-- TODO fmtStatus :: Status -> String

-- affiche un jeu (plateau, nombre de coups joués, statut)
display :: Game -> IO ()
display g@(_, n, s) = do
    putStrLn ""
    forM_ [0..2] $ \i -> do
        forM_ [0..2] $ \j -> do
            let c = getCell g (i, j)
            putChar c
        putStrLn ""
    putStrLn $ "nb moves: " ++ show n
    putStrLn $ "status: " ++ s

-- saisit une position à jouer
-- 
-- recommence la saisie tant qu'on n'a pas une position (2 entiers)
-- mais ne vérifie pas que ces deux entiers sont valides (entre 0 et 2)
askMove :: IO Ix2
askMove = do
  putStr"move? "
  hFlush stdout
  input <- getLine
  case map readMaybe (words input) of
    [Just i, Just j] -> pure (i, j)
    _ -> do
        putStrLn "not a move (should be: 'i j')"
        askMove

-- déroule le jeu jusqu'à la fin
run :: Game -> IO Game
run g = do
  display g
  ij <- askMove 
  case playMove g ij of
    Nothing -> do
        putStrLn "invalid move"
        run g
    Just g' -> 
        if isRunning g' then run g' else pure g'

-- programme principal
main :: IO ()
main = do
    g <- run mkGame
    display g

