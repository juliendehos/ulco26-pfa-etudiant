
{-# LANGUAGE OverloadedStrings #-}

-- import Control.Monad.IO.Unlift
import Control.Monad.Reader
import Network.Wai.Middleware.RequestLogger
import Web.Scotty.Trans

import Counter1
import View

main :: IO ()
main = do
  counter <- mkCounter
  scottyT 3000 (runApp counter) serverApp

type AppM = ReaderT Counter IO

runApp :: Counter -> AppM a -> IO a
runApp c app = runReaderT app c

serverApp :: ScottyT AppM ()
serverApp = do

  middleware logStdout

  get "/" $ do
    -- TODO counter
    html $ myRender $ mkPage 0

    -- TODO inc, dec

