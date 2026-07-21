
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Applications.Init where

import Database.Selda.SQLite (sqliteOpen, seldaClose)
import Effectful
import Effectful.Log
import Log.Backend.StandardOutput
import UnliftIO.Exception (bracket)

import Applications.Params
import Effects.Db
import Interpreters.DbSelda

myApp :: (Log :> es, IOE :> es) => Eff es ()
myApp = do
  logInfo_ "myApp"
  -- TODO dbReset

runApp :: Eff [Log, IOE] a -> IO a
runApp = runEff . myLog
  where

    myLog app = 
      withStdOutLogger $ \stdoutLogger -> 
        runLog "forum-init" stdoutLogger defaultLogLevel app

    -- TODO myDb app = bracket (sqliteOpen dbFilename) seldaClose (flip runDbSelda app)

