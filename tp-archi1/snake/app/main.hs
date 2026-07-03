
{-# LANGUAGE TemplateHaskell #-}

module Main where

import Control.Lens
import Control.Monad.Trans.State
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Linear.V2
import System.Random

import Snake

-------------------------------------------------------------------------------
-- global parameters
-------------------------------------------------------------------------------

gCellSizeI :: Int
gCellSizeI = 32

gCellSizeF :: Float
gCellSizeF = fromIntegral gCellSizeI

-------------------------------------------------------------------------------
-- World
-------------------------------------------------------------------------------

data World = World
  { _wGameState :: GameState
  }

makeLenses ''World

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

main :: IO ()
main = do
  let 
      gs = mkGameState
      (V2 bx by) = gs ^. gsBoundaries
      win = InWindow "snake" (gCellSizeI*(1+2*bx), gCellSizeI*(1+2*by)) (0, 0)
      bg = black
      fps = 60
      world = World gs
  play win bg fps world hDraw hEvent hIdle

hDraw :: World -> Picture
hDraw (World gs) = 
  pictures
    [ color red $ myTranslate (V2 (-6) 2) $ rectangleSolid gCellSizeF gCellSizeF
    ]
    -- TODO

  where
    myTranslate (V2 x y) = 
      translate (gCellSizeF*fromIntegral x) (gCellSizeF*fromIntegral y)

hEvent :: Event -> World -> World
hEvent _ w = w
-- TODO

hIdle :: Float -> World -> World
hIdle dt w = w
-- TODO

