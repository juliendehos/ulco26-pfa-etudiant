
import Control.Monad
import Control.Monad.Reader
import System.IO

import Counter1

minValue, maxValue :: Integer
minValue = -3
maxValue = 3

display :: Counter -> IO ()
display c = do
  v <- runReaderT getCounter c
  putStrLn $ "\nValue = " <> show v

myApp :: Counter -> IO ()
myApp c = do
  v <- runReaderT getCounter c
  when (minValue <= v && v <= maxValue) $ do
    display c
    putStrLn "Enter command (+/-)?"
    input <- getChar
    case input of
      -- TODO gérer '+' et '-'
      'q' -> pure ()
      _ -> putStr "\ninvalid command"
    unless (input == 'q') (myApp c)

main :: IO ()
main = do
  hSetBuffering stdin NoBuffering
  c <- mkCounter
  myApp c
  display c

