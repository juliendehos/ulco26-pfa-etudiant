
module Tictactoe where

import Control.Monad
import Data.Vector.Unboxed qualified as V

-- cellule du plateau de jeu
-- TODO ADT
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
-- TODO ADT
type Status = String

statusXPlay, statusOPlay, statusXWin, statusOWin, statusTie :: Status
statusXPlay = "X play"
statusOPlay = "O play"
statusXWin = "X win"
statusOWin = "O win"
statusTie = "tie"

-- jeu : plateau, nombre de coups joués, statut
-- TODO ADT
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
isRunning :: Game -> Bool
isRunning (_, _, s) = s == statusXPlay || s == statusOPlay

-- retourne le contenu d'une position donnée du jeu 
getCell :: Game -> Ix2 -> Cell
getCell (b, _, _) ij = 
  let k = ij2k ij
  in b V.! k

-- joue une position donnée dans un jeu donnée
-- 
-- Vérifie si le jeu n'est pas terminé et si la position est valide.
playMove :: Game -> Ix2 -> Maybe Game
playMove g@(b, n, s) ij@(i, j) = do
  guard $ isRunning g
  guard $ i>=0 && i<=2 && j>=0 && j<=2
  let k = ij2k ij
      c = b V.! k
  guard $ c == cellEmpty
  let (c', sWin, sPlay) = if s == statusXPlay
                            then (cellX, statusXWin, statusOPlay)
                            else (cellO, statusOWin, statusXPlay)
      b' = b V.// [(k, c')]
      n' = n + 1
      s' = checkBoard b' ij c' n' sWin sPlay
  Just (b', n', s')
    
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
checkBoard b (i, j) c n sWin sPlay
  | row || col || diag1 || diag2 = sWin
  | n == 9 = statusTie
  | otherwise = sPlay
  where
      check ii jj = c == b V.! ij2k (ii, jj)
      row = check i 0 && check i 1 && check i 2
      col = check 0 j && check 1 j && check 2 j
      diag1 = check 0 0 && check 1 1 && check 2 2
      diag2 = check 0 2 && check 1 1 && check 2 0

