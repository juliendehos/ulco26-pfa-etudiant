
{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.Trans.Class
import Network.Wai.Middleware.RequestLogger
import Web.Scotty.Trans

import Counter2
import View

main :: IO ()
main = do
  var <- mkVar 
  scottyT 3000 (runApp var) serverApp

type AppM = CounterT IO

runApp :: MyVar -> AppM a -> IO a
runApp var app = runCounterT app var

serverApp :: ScottyT AppM ()
serverApp = do

  middleware logStdout

  get "/" $ do
    -- TODO counter
    html $ myRender $ mkPage 0

  -- TODO inc, dec

