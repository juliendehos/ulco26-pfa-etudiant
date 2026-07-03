
{-# LANGUAGE TemplateHaskell #-}

module Maze 
  ( Cell(..)
  , Move(..)
  , Maze
  , mkMaze
  , getSize
  -- , getPlayer
  -- , getTargets
  -- , getWalls
  -- , getTerminated
  -- , playMove
  ) where

import Control.Lens
import Data.Vector

-------------------------------------------------------------------------------
-- public
-------------------------------------------------------------------------------

data Cell
  = CellEmpty
  | CellWall
  | CellTarget
  deriving (Eq)

data Board = Board
  { _ni :: Int
  , _nj :: Int
  , _cells :: Vector Cell
  }

makeLenses ''Board

data Maze = Maze
  { _i :: Int
  , _j :: Int
  , _board :: Board
  , _terminated :: Bool
  }

makeLenses ''Maze

mkMaze :: Int -> Int -> Int -> Int -> Vector Cell -> Maze
mkMaze ni' nj' i' j' cells' = Maze i' j' (Board ni' nj' cells') False

data Move
  = MoveUp
  | MoveDown
  | MoveLeft
  | MoveRight

getSize :: Maze -> (Int, Int)
getSize maze = (maze ^. board . ni, maze ^. board . nj)

-- TODO getPlayer :: Maze -> (Int, Int)

-- TODO getTargets :: Maze -> [(Int, Int)]

-- TODO getWalls :: Maze -> [(Int, Int)]

-- TODO getTerminated :: Maze -> Bool

-- TODO playMove :: Move -> Maze -> Maze

-------------------------------------------------------------------------------
-- internal
-------------------------------------------------------------------------------

k2ij :: Board -> Int -> (Int, Int)
k2ij b k = 
  let n = b ^. nj
  in (div k n, rem k n)

ij2k :: Board -> (Int, Int) -> Int
ij2k b (i', j') = i' * (b ^. nj) + j'

