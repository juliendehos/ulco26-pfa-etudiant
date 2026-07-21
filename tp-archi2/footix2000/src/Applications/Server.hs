
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Applications.Server where

import Control.Monad.Trans.Class
import Database.Selda.Backend 
import Database.Selda.SQLite 
import Effectful 
import Effectful.Log
import Log.Backend.StandardOutput
import Web.Scotty.Trans

import Applications.Html
import Effects.Api
import Effects.Db
import Interpreters.ApiDb
import Interpreters.DbSelda


type AppM = Eff [Log, IOE]


serverApp :: ScottyT AppM ()
serverApp = do

  get "/" $ do
    logInfo_ "GET /"
    -- TODO get data from DB
    html $ myRender $ mkPage [] []

    -- TODO API


runApp :: SeldaConnection SQLite -> AppM a -> IO a
runApp conn = runEff . myLog
  where
    myLog app = 
      withStdOutLogger $ \stdoutLogger -> 
        runLog "footix2000-server" stdoutLogger defaultLogLevel app

