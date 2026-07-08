
import Control.Monad
import System.Random
import Text.Read (readMaybe)

data Status
  = TooLow
  | TooHigh
  | Invalid
  | Win
  | Lose
  deriving (Eq, Show)

data GameState = GameState
  { _remaining :: Int
  , _target :: Int
  }

playMove :: Int -> GameState -> (Status, GameState)
playMove m gs0 = 
  if m < 1 || m > 100
    then (Invalid, gs0)
    else
      let remaining = _remaining gs0
          gs1 = gs0 { _remaining = remaining - 1}
          target = _target gs0
          s1 | m == target = Win
             | remaining <= 1 = Lose
             | m < target = TooLow
             | otherwise = TooHigh
      in (s1, gs1)

gameLoop :: GameState -> IO ()
gameLoop gs0 = do
  let remaining = _remaining gs0
  putStrLn $ "move (" <> show remaining <> ")?"
  input <- getLine
  case readMaybe input of
    Nothing -> do
      putStrLn "not a number"
      gameLoop gs0
    Just m -> do
      let (s1, gs1) = playMove m gs0
      print s1
      unless (s1 == Win || s1 == Lose) (gameLoop gs1)

main :: IO ()
main = do
  gen <- getStdGen
  let target = fst $ randomR (1, 100) gen
      game = GameState 7 target
  gameLoop game
  print target

