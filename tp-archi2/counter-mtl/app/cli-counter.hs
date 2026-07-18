
import System.IO

import Applications.Cli
import Interpreters.CounterTVar

main :: IO ()
main = do
  hSetBuffering stdin NoBuffering
  var <- mkVar
  runApp var (myApp >> display)

