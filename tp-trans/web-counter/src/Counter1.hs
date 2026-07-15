
module Counter1 where

import Control.Monad.Reader
import Control.Concurrent.STM

newtype Counter = Counter { unCounter :: TVar Integer }

mkCounter :: MonadIO m => m Counter
mkCounter = Counter <$> liftIO (newTVarIO 0)

getCounter :: (MonadReader Counter m, MonadIO m) => m Integer
getCounter = do
  var <- asks unCounter
  liftIO $ readTVarIO var

-- TODO addCounter
-- pour modifier un TVar : atomically $ modifyTVar var (+n)

