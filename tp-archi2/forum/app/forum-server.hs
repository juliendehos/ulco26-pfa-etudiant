
import Database.Selda.SQLite (sqliteOpen, seldaClose)
import Web.Scotty.Trans
import UnliftIO.Exception (bracket)

import Applications.Params
import Applications.Server

main :: IO ()
main = 
  bracket (sqliteOpen dbFilename) seldaClose $ \c ->
    scottyT 3000 (runApp c) serverApp

