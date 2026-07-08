
module StateT where

import Control.Monad.Trans
import Data.Functor.Identity

import MonadState

-------------------------------------------------------------------------------
-- StateT
-------------------------------------------------------------------------------

newtype StateT s m a = StateT { runStateT :: s -> m (a, s) }

-------------------------------------------------------------------------------
-- State
-------------------------------------------------------------------------------

type State s = StateT s Identity

runState :: State s a -> s -> (a, s)
runState m1 = runIdentity . runStateT m1

-------------------------------------------------------------------------------
-- actions
-------------------------------------------------------------------------------

state :: Monad m => (s -> (a, s)) -> StateT s m a
state f = StateT (return . f)

get :: Monad m => StateT s m s
get = StateT $ \s0 -> pure (s0, s0)

put :: Monad m => s -> StateT s m ()
put s1 = StateT $ \_ -> pure ((), s1)

modify :: Monad m => (s -> s) -> StateT s m ()
modify f = StateT $ \s0 -> pure ((), f s0)

gets :: Monad m => (s -> t) -> StateT s m t
gets f = StateT $ \s0 -> pure (f s0, s0)

-------------------------------------------------------------------------------
-- instance Functor
-------------------------------------------------------------------------------

instance Monad m => Functor (StateT s m) where

  -- fmap :: (a -> b) -> StateT s m a -> StateT s m b
  fmap f m1 = StateT $ \s0 -> do
    (a1, s1) <- runStateT m1 s0
    pure (f a1, s1)

-------------------------------------------------------------------------------
-- instance Applicative
-------------------------------------------------------------------------------

instance Monad m => Applicative (StateT s m) where

  -- pure :: a -> StateT s m a
  pure a = StateT $ \s0 -> pure (a, s0)

  -- (<*>) :: StateT s m (a -> b) -> StateT s m a -> StateT s m b
  m1 <*> m2 = StateT $ \s0 -> do
    (f1, s1) <- runStateT m1 s0
    (a2, s2) <- runStateT m2 s1
    pure (f1 a2, s2)

-------------------------------------------------------------------------------
-- instance Monad
-------------------------------------------------------------------------------

instance Monad m => Monad (StateT s m) where

  -- (>>=) :: StateT s m a -> (a -> StateT s m b) -> StateT s m b
  m1 >>= k = StateT $ \s0 -> do
    (a1, s1) <- runStateT m1 s0
    runStateT (k a1) s1 

-------------------------------------------------------------------------------
-- instance MonadTrans
-------------------------------------------------------------------------------

instance MonadTrans (StateT s) where

  -- lift :: m a -> StateT s m a
  lift m1 = StateT $ \s0 -> do
    x <- m1
    pure (x, s0)

-------------------------------------------------------------------------------
-- instance MonadState
-------------------------------------------------------------------------------

-- instance MonadState s (StateT s IO) where
instance Monad m => MonadState s (StateT s m) where

  -- get :: Monad m => StateT s m s
  get = StateT.get

  -- put :: Monad m => s -> StateT s m ()
  put = StateT.put

  -- state :: Monad m => (s -> (a, s)) -> StateT s m a
  state = StateT.state

-------------------------------------------------------------------------------
-- instance MonadIO
-------------------------------------------------------------------------------

-- instance MonadIO (StateT s IO) where
instance (MonadIO m) => MonadIO (StateT s m) where

  -- liftIO :: MonadIO m => IO a -> StateT s m a
  liftIO = lift . liftIO

