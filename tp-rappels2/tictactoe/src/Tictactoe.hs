
module Tictactoe where

import Control.Monad
import Data.Vector.Unboxed qualified as V

-- cellule du plateau de jeu
type Cell = Char

cellEmpty, cellX, cellO :: Cell
cellEmpty = '.'
cellX = 'X'
cellO = 'O'

-- plateau de jeu
type Board = V.Vector Cell

-- nombre de coups déjà joués
type NbMoves = Int

-- statut du jeu
type Status = String

statusXPlay, statusOPlay, statusXWin, statusOWin, statusTie :: Status
statusXPlay = "X play"
statusOPlay = "O play"
statusXWin = "X win"
statusOWin = "O win"
statusTie = "tie"

-- jeu : plateau, nombre de coups joués, statut
type Game = (Board, NbMoves, Status)

-- position ligne-colonne (i, j) dans le plateau de jeu
type Ix2 = (Int, Int)

-- calcule l'indice k dans un vector
-- correspondant à la position (i, j) dans le plateau de jeu
ij2k :: Ix2 -> Int
ij2k (i, j) = i*3 + j

-- contruit un jeu initial
mkGame :: Game
mkGame = (V.replicate 9 '.', 0, statusXPlay)

-- teste si le jeu est encore en cours
-- TODO isRunning :: Game -> Bool

-- retourne le contenu d'une position donnée du jeu 
-- TODO getCell :: Game -> Ix2 -> Cell

-- joue une position donnée dans un jeu donnée
-- 
-- Vérifie si le jeu n'est pas terminé et si la position est valide.
-- TODO playMove :: Game -> Ix2 -> Maybe Game
    
-- teste un nouveau plateau, pour mettre à jour son statut
-- 
-- vérifie également si le jeu termine par une égalité
checkBoard
  :: Board    -- plateau joué
  -> Ix2      -- position jouée
  -> Cell     -- cellule jouée
  -> NbMoves  -- nombre de coups joués
  -> Status   -- nouveau statut si le coup joué fait gagner le jeu
  -> Status   -- nouveau statut si le coup joué ne fait pas gagner le jeu
  -> Status
checkBoard b (i, j) c n sWin sPlay = sPlay  -- TODO checkBoard

