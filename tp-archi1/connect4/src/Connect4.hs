
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}

module Connect4 
  ( Status(..)
  , GameState
  , Position
  , gNbI
  , gNbJ
  , newGameState
  , resetGameState
  -- , isRunning
  , getStatus
  -- , getRedCells
  -- , getYellowCells
  -- , playMove
  ) where

import Control.Lens
import Data.Vector qualified as V
import Linear.V2

-------------------------------------------------------------------------------
-- types & params
-------------------------------------------------------------------------------

gNbI, gNbJ, gNbA :: Int
gNbI = 6    -- nombre de lignes
gNbJ = 7    -- nombre de colonnes
gNbA = 4    -- nombre de pions à aligner pour gagner

data Status
  = RedPlay
  | YellowPlay
  | RedWin
  | YellowWin
  | Tie
  deriving (Eq, Show)

data Cell
  = CellEmpty
  | CellRed
  | CellYellow
  deriving (Eq)

type Position = V2 Int
type Heights = V.Vector Int
type Board = V.Vector Cell

data GameState = GameState
  { _gsBoard        :: Board
  , _gsStatus       :: Status
  , _gsHeights      :: Heights
  -- TODO gérer le 1er joueur
  }

makeLenses ''GameState

-------------------------------------------------------------------------------
-- public
-------------------------------------------------------------------------------

newGameState :: GameState
newGameState = 
  GameState 
    (V.replicate (gNbI * gNbJ) CellEmpty)
    RedPlay
    (V.replicate gNbJ 0)

-- TODO changer le 1er joueur
resetGameState :: GameState
resetGameState = newGameState

-- TODO isRunning :: GameState -> Bool

getStatus :: GameState -> Status
getStatus _ = Tie -- TODO 

-- TODO getRedCells :: GameState -> V.Vector Position

-- TODO getYellowCells :: GameState -> V.Vector Position

-- TODO playMove :: Int -> GameState -> GameState

-------------------------------------------------------------------------------
-- internal
-------------------------------------------------------------------------------

k2ij :: Int -> Position
k2ij k = V2 (div k gNbJ) (rem k gNbJ)

ij2k :: Position -> Int
ij2k (V2 i j) = i*gNbJ + j

