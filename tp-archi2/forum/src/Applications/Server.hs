
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Applications.Server where

import Control.Monad.Trans.Class
import Database.Selda.Backend (SeldaConnection)
import Database.Selda.SQLite (SQLite)
import Effectful 
import Effectful.Log
import Log.Backend.StandardOutput
import Web.Scotty.Trans

import Applications.Html
import Domain.Message
import Effects.Db
import Interpreters.DbSelda


type AppM = Eff [Log, IOE]


serverApp :: ScottyT AppM ()
serverApp = do

  get "/" $ do
    logInfo_ "GET /"
    -- TODO db
    html $ myRender $ mkPage []

  post "/add" $ do
    logInfo_ "POST /add"
    -- TODO params
    -- TODO db
    redirect "/"


runApp :: SeldaConnection SQLite -> AppM a -> IO a
runApp conn = runEff . myLog
  where
    myLog app = 
      withStdOutLogger $ \stdoutLogger -> 
        runLog "forum-server" stdoutLogger defaultLogLevel app

