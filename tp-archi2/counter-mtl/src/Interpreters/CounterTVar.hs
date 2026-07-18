
module Interpreters.CounterTVar where

import Control.Concurrent.STM
import Control.Monad.Reader
import Control.Monad.IO.Unlift

import Effects.Counter

type MyVar = TVar Integer

mkVar :: MonadIO m => m MyVar
mkVar = liftIO (newTVarIO 0)

newtype CounterT m a = 
  CounterT { unCounterT :: ReaderT MyVar m a }
  deriving (Functor, Applicative, Monad, MonadReader MyVar, MonadTrans, MonadUnliftIO)

runCounterT :: MonadIO m => MyVar -> CounterT m a -> m a
runCounterT var app = runReaderT (unCounterT app) var

instance MonadIO m => MonadIO (CounterT m) where
  liftIO = lift . liftIO

instance MonadIO m => MonadCounter (CounterT m) where
  getCounter = do
    var <- ask
    liftIO $ readTVarIO var

{-
instance MonadLogger m => MonadLogger (CounterT m) where
  logMsg = lift . logMsg
-}

