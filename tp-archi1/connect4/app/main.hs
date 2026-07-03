
import Data.Vector as V
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Linear.V2

import Connect4

-------------------------------------------------------------------------------
-- global parameters
-------------------------------------------------------------------------------

gCellSizeI, gStatusHeightI :: Int
gCellSizeI = 50
gStatusHeightI = 50

gCellSizeF, gNbIF, gNbJF, gNbIF2, gNbJF2, gStatusHeightF, gWidth2, gHeight2 :: Float
gCellSizeF = fromIntegral gCellSizeI
gNbIF = fromIntegral gNbI
gNbJF = fromIntegral gNbJ
gNbIF2 = gNbIF*0.5
gNbJF2 = gNbJF*0.5
gStatusHeightF = fromIntegral gStatusHeightI
gWidth2 = gCellSizeF*gNbJF*0.5
gHeight2 = gCellSizeF*gNbIF*0.5

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

main :: IO ()
main = do
  let 
      win = InWindow "connect4" (gCellSizeI*gNbJ, gCellSizeI*gNbI+gStatusHeightI) (0, 0)
      bg = black
      fps = 60
  play win bg fps newGameState hDraw hEvent hIdle

hDraw :: GameState -> Picture
hDraw gs = status <> board

  where

    status = 
      color white 
      $ translate (10 - gWidth2) (-gHeight2 - 0.2*gStatusHeightF)
      $ scale 0.2 0.2
      $ text $ show $ getStatus gs

    board = 
      translate 0 (0.5*gStatusHeightF)
      $ scale gCellSizeF gCellSizeF
      $ pictures
          [ background
          , color green $ drawCell (V2 0 2)
          -- TODO
          ]

    background = 
      color blue
      $ rectangleSolid gNbJF gNbIF

    drawCell :: Position -> Picture
    drawCell (V2 i j) = 
      translate (fromIntegral j - gNbJF2 + 0.5) (fromIntegral i - gNbIF2 + 0.5)
      $ circleSolid 0.5

hEvent :: Event -> GameState -> GameState
hEvent _ gs = gs
-- TODO

hIdle :: Float -> GameState -> GameState
hIdle _ gs = gs

