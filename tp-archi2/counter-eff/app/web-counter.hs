
import Web.Scotty.Trans

import Applications.Web
import Interpreters.CounterTVar

main :: IO ()
main = do
  var <- mkVar 
  scottyT 3000 (runApp var) serverApp

