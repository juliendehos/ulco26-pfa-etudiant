
module Applications.Cli where

import Control.Monad
import Control.Monad.Reader

import Effects.Counter
import Interpreters.CounterTVar

minValue, maxValue :: Integer
minValue = -3
maxValue = 3

display :: (MonadIO m, MonadCounter m) => m ()
display = do
  v <- getCounter
  liftIO $ putStrLn $ "\nValue = " <> show v

myApp :: (MonadIO m, MonadCounter m) => m ()
myApp = do
  v <- getCounter
  when (minValue <= v && v <= maxValue) $ do
    display
    liftIO $ putStrLn "Enter command (+/-)?"
    input <- liftIO getChar
    case input of
      -- TODO '+'
      -- TODO '-'
      'q' -> pure ()
      _ -> liftIO $ putStrLn "\ninvalid command"
    unless (input == 'q') myApp

runApp :: MyVar -> CounterT IO a -> IO a
runApp = runCounterT

