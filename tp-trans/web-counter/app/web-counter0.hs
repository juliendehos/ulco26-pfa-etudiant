
{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.Reader
import Network.Wai.Middleware.RequestLogger
import Web.Scotty

import Counter1
import View

main :: IO ()
main = do
  counter <- mkCounter
  scotty 3000 (serverApp counter)

serverApp :: Counter -> ScottyM ()
serverApp counter = do

    middleware logStdout

    get "/" $ do
      c <- runReaderT getCounter counter
      html $ myRender $ mkPage c

    -- TODO routes inc et dec

