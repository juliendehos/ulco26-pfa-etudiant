
module Main where

import Graphics.Gloss.Interface.IO.Game
import System.Environment
import System.Exit

import Maze
import Parse

-------------------------------------------------------------------------------
-- global parameters
-------------------------------------------------------------------------------

gCellSizeI :: Int
gCellSizeI = 20

gCellSizeF :: Float
gCellSizeF = fromIntegral gCellSizeI

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

main :: IO ()
main = do
  -- TODO
  res <- readMaze "data/maze1.txt"
  case res of
    Left err -> putStrLn err
    Right maze -> runApp maze

-------------------------------------------------------------------------------
-- gloss app
-------------------------------------------------------------------------------

runApp :: Maze -> IO ()
runApp maze = 
  let (ni, nj) = getSize maze
      win = InWindow "maze" (nj*gCellSizeI, ni*gCellSizeI) (0, 0)
      bg = black
      fps = 60
  in playIO win bg fps maze hDraw hEvent hIdle

hDraw :: Maze -> IO Picture
hDraw w = 
  pure 
    $ scale gCellSizeF (-gCellSizeF)
    $ translate (0.5 - 0.5 * fromIntegral nj) (0.5 - 0.5 * fromIntegral ni)
    $ pictures
        [ translate 0 0 $ color yellow $ rectangleSolid 1 1
        , translate 4 2 $ color red $ rectangleSolid 1 1
        ]
        -- TODO

  where
    (ni, nj) = getSize w

hEvent :: Event -> Maze -> IO Maze
hEvent (EventKey (SpecialKey KeyEsc) Down _ _) _ = exitSuccess
hEvent _ w = pure w
-- TODO

hIdle :: Float -> Maze -> IO Maze
hIdle _ = pure

