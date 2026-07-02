
module Game1 
  ( GameState
  , newGame
  , getXY
  , getLabel
  , playMove
  , Move(..)
  ) where

data Move
  = MoveUp
  | MoveDown
  | MoveLeft
  | MoveRight

data Position = Position
  { _x :: Float
  , _y :: Float
  } 

data GameState = GameState
  { _pos :: Position
  , _label :: String
  }

newGame :: GameState
newGame = GameState (Position 0 0) ""

getLabel :: GameState -> String
getLabel (GameState _ l) = l

getXY :: GameState -> (Float, Float)
getXY (GameState (Position x y) _) = (x, y)

playMove :: Move -> GameState -> GameState
playMove m (GameState (Position x y) _) = 
  case m of
    MoveUp    -> GameState (Position x (y+10)) "up"
    MoveDown  -> GameState (Position x (y-10)) "down"
    MoveLeft  -> GameState (Position (x-10) y) "left"
    MoveRight -> GameState (Position (x+10) y) "right"

