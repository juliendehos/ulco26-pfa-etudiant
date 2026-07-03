
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TemplateHaskell #-}

module Snake where

import Control.Lens
import Control.Monad
import Control.Monad.Trans.State
import Linear.V2
import System.Random

-------------------------------------------------------------------------------
-- public
-------------------------------------------------------------------------------

type Vec = V2 Int

data Direction 
  = DirectionUp
  | DirectionDown
  | DirectionLeft
  | DirectionRight
  deriving (Eq)

data Snake = Snake
  { _sDir    :: Direction
  , _sHead   :: Vec
  , _sBody   :: [Vec]
  }

makeLenses ''Snake

data GameState = GameState
  { _gsBoundaries   :: Vec
  , _gsTimeStep     :: Float
  , _gsTime         :: Float
  , _gsScore        :: Int
  , _gsSnake        :: Snake
  , _gsApple        :: Vec
  }

makeLenses ''GameState

mkGameState :: GameState
mkGameState = GameState (V2 10 10) 0.15 0 0 mkSnake (V2 0 0) 
  -- TODO utiliser resetApple ou placer la pomme aléatoirement

-- TODO update :: Float -> State GameState ()

-- TODO changeDirection :: Direction -> State GameState ()

-------------------------------------------------------------------------------
-- internal
-------------------------------------------------------------------------------

mkSnake :: Snake
mkSnake = Snake DirectionRight (V2 0 0) [V2 (-1) 0]

dir2vec :: Direction -> Vec
dir2vec = \case
  DirectionUp      -> V2 0 1
  DirectionDown    -> V2 0 (-1)
  DirectionLeft    -> V2 (-1) 0
  DirectionRight   -> V2 1 0

-- TODO myRandomR :: Random a => (a, a) -> State GameState a

-- TODO resetApple :: State GameState ()

data StepStatus
  = StepOk
  | StepKo
  | StepApple

-- TODO stepSnake :: State GameState StepStatus

