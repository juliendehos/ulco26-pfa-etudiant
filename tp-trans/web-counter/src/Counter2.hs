
module Counter2 where

import Control.Concurrent.STM
import Control.Monad.Reader
import Control.Monad.IO.Unlift

class Monad m => MonadCounter m where
  getCounter :: m Integer
  -- TODO addCounter

type MyVar = TVar Integer

newtype CounterT m a = 
  CounterT { unCounterT :: ReaderT MyVar m a }
  deriving (Functor, Applicative, Monad, MonadReader MyVar, MonadTrans, MonadUnliftIO)

mkVar :: MonadIO m => m MyVar
mkVar = liftIO (newTVarIO 0)

runCounterT :: MonadIO m => CounterT m a -> TVar Integer -> m a
runCounterT app var = runReaderT (unCounterT app) var

instance MonadIO m => MonadIO (CounterT m) where
  liftIO = lift . liftIO

instance MonadIO m => MonadCounter (CounterT m) where

  getCounter = do
    var <- ask
    liftIO $ readTVarIO var

