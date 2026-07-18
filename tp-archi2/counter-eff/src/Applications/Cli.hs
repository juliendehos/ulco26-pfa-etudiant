
{-# LANGUAGE DataKinds #-}

module Applications.Cli where

import Control.Monad
import Effectful 

import Effects.Counter
import Interpreters.CounterTVar

minValue, maxValue :: Integer
minValue = -3
maxValue = 3

display :: (Counter :> es, IOE :> es) => Eff es ()
display = do
  v <- getCounter
  liftIO $ putStrLn $ "\nValue = " <> show v

myApp :: (Counter :> es, IOE :> es) => Eff es ()
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
      _ -> liftIO $ putStrLn "invalid command"
    unless (input == 'q') myApp

runApp :: MyVar -> Eff [Counter, IOE] a -> IO a
runApp var app = runEff $ runCounterTVar var app

