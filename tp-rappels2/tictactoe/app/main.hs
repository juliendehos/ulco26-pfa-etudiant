
import Control.Monad ( forM_ )
import System.IO ( hFlush, stdout )
import Text.Read ( readMaybe )

import Tictactoe

-- affiche un jeu (plateau, nombre de coups joués, statut)
-- TODO display :: Game -> IO ()

-- saisit une position à jouer
-- 
-- recommence la saisie tant qu'on n'a pas une position (2 entiers)
-- mais ne vérifie pas que ces deux entiers sont valides (entre 0 et 2)
-- TODO askMove :: IO Ix2

-- déroule le jeu jusqu'à la fin
-- TODO run :: Game -> IO Game

-- programme principal
main :: IO ()
main = pure ()  -- TODO main

