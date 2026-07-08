
module MonadState where

class Monad m => MonadState s m where
  get :: m s
  put :: s -> m ()
  state :: (s -> (a, s)) -> m a

modify :: MonadState s m => (s -> s) -> m ()
modify f = state (\s -> ((), f s))

gets :: MonadState s m => (s -> a) -> m a
gets f = f <$> get

