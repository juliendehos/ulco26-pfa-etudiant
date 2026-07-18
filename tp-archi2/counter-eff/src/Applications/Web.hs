
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Applications.Web where

import Control.Monad.Trans.Class
import Effectful 
import Web.Scotty.Trans

import Applications.Html
import Effects.Counter
import Interpreters.CounterTVar

type AppM = Eff [Counter, IOE]

runApp :: MyVar -> AppM a -> IO a
runApp var app = runEff $ runCounterTVar var app

serverApp :: ScottyT AppM ()
serverApp = do

    get "/" $ do
      c <- lift getCounter
      -- TODO lift $ logMsg $ "counter = " <> show c
      html $ myRender $ mkPage c

    post "/inc" $ do
      -- TODO
      redirect "/"

    post "/dec" $ do
      -- TODO
      redirect "/"

