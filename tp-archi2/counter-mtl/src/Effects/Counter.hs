
module Effects.Counter where

class Monad m => MonadCounter m where
  getCounter :: m Integer

  -- TODO addCounter 

