
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE LambdaCase #-}

module Interpreters.CounterTVar where

import Control.Concurrent.STM
import Effectful
import Effectful.Dispatch.Dynamic

import Effects.Counter

type MyVar = TVar Integer

mkVar :: IO MyVar
mkVar = newTVarIO 0

runCounterTVar :: IOE :> es => MyVar -> Eff (Counter : es) a -> Eff es a
runCounterTVar var = interpret $ \_env -> \case

  GetCounter -> liftIO $ readTVarIO var

