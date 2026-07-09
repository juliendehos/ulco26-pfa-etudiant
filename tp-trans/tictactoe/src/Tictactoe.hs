
{-# LANGUAGE TemplateHaskell #-}

module Tictactoe 
  ( Cell(..)
  , Status(..)
  , Ix2
  , GameState(..)
  , mkGameState
  , getCell
  , getNbMoves
  , getStatus
  , isRunning
  , playMove
  ) where

import Control.Lens
import Control.Monad
import Data.Vector qualified as V

-------------------------------------------------------------------------------
-- types
-------------------------------------------------------------------------------

-- cellule du plateau de jeu
data Cell 
  = CellEmpty
  | CellX
  | CellO
  deriving (Eq, Show)

-- plateau de jeu
type Board = V.Vector Cell

-- statut du jeu
data Status
  = StatusXPlay
  | StatusOPlay
  | StatusXWin
  | StatusOWin
  | StatusTie
  deriving (Eq, Show)

-- jeu : plateau, nombre de coups joués, statut
data GameState = GameState
  { _gsBoard :: Board
  , _gsNbMoves :: Int
  , _gsStatus :: Status
  }

makeLenses ''GameState

-- position ligne-colonne (i, j) dans le plateau de jeu
type Ix2 = (Int, Int)

-------------------------------------------------------------------------------
-- public
-------------------------------------------------------------------------------

-- contruit un jeu initial
mkGameState :: GameState
mkGameState = GameState (V.replicate 9 CellEmpty) 0 StatusXPlay

-- teste si le jeu est encore en cours
isRunning :: GameState -> Bool
isRunning gs = 
  gs^.gsStatus == StatusXPlay || gs^.gsStatus == StatusOPlay

-- retourne le contenu d'une position donnée du jeu 
getCell :: Ix2 -> GameState -> Cell
getCell ij gs =
  let k = ij2k ij
  in (gs^.gsBoard) V.! k

-- nombre de coups déjà joués
getNbMoves :: GameState -> Int
getNbMoves gs = gs^.gsNbMoves

-- status courant du jeu
getStatus :: GameState -> Status
getStatus gs = gs^.gsStatus

-- joue une position donnée dans un jeu donnée
-- 
-- Vérifie si le jeu n'est pas terminé et si la position est valide.
playMove :: Ix2 -> GameState -> Maybe GameState
playMove ij@(i, j) gs = do
  guard (isRunning gs)
  guard $ i>=0 && i<=2 && j>=0 && j<=2
  let k = ij2k ij
      c = (gs^.gsBoard) V.! k
  guard $ c == CellEmpty
  let (c', sWin, sPlay) = if gs^.gsStatus == StatusXPlay
                            then (CellX, StatusXWin, StatusOPlay)
                            else (CellO, StatusOWin, StatusXPlay)
  pure $ gs & gsBoard %~ (V.// [(k, c')])
            & gsNbMoves +~ 1
            & updateStatus ij c' sWin sPlay

-------------------------------------------------------------------------------
-- internal
-------------------------------------------------------------------------------

-- calcule l'indice k dans un vector
-- correspondant à la position (i, j) dans le plateau de jeu
ij2k :: Ix2 -> Int
ij2k (i, j) = i*3 + j

-- teste un nouveau plateau, pour mettre à jour son statut
-- 
-- vérifie également si le jeu termine par une égalité
updateStatus
  :: Ix2      -- position jouée
  -> Cell     -- cellule jouée
  -> Status   -- nouveau statut si le coup joué fait gagner le jeu
  -> Status   -- nouveau statut si le coup joué ne fait pas gagner le jeu
  -> GameState
  -> GameState
updateStatus (i, j) c sWin sPlay gs
  | row || col || diag1 || diag2 = gs & gsStatus .~ sWin
  | gs^.gsNbMoves == 9 = gs & gsStatus .~ StatusTie
  | otherwise = gs & gsStatus .~ sPlay
  where
    check ii jj = c == (gs^.gsBoard) V.! ij2k (ii, jj)
    row = check i 0 && check i 1 && check i 2
    col = check 0 j && check 1 j && check 2 j
    diag1 = check 0 0 && check 1 1 && check 2 2
    diag2 = check 0 2 && check 1 1 && check 2 0

