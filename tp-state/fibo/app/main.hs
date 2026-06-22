
import Control.Monad.Trans.State
import Data.IntMap qualified as M
import Options.Applicative

-------------------------------------------------------------------------------
-- fibo*
-- 
-- Retourne le n-ieme terme de la suite de Fibonacci.
-------------------------------------------------------------------------------

-- Algorithme "itératif".
fiboIterative :: Int -> Integer
fiboIterative n = go 0 0 1
  where
    go i a b = if i == n then a else go (i+1) b (a+b)

-- Algorithme naif.
-- TODO fiboNaive :: Int -> Integer

-- Algorithme naif avec un cache (M.IntMap Integer).
-- TODO fiboNaiveCache :: Int -> Integer

-- Algorithme naif avec un cache + State.
-- TODO fiboNaiveState :: Int -> Integer

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

myArgs :: Parser (String, Int)
myArgs = (,)
      <$> argument str (metavar "algo" <> help "iterative | naive | cache | state" )
      <*> argument auto (metavar "nsims" <> help "number of monte-carlo simulations" )

main :: IO ()
main = do

  (algo, nsims) <- execParser 
                    (info (myArgs <**> helper)
                          (fullDesc <> header "Compute pi using monte-carlo."))

  case algo of
    "iterative" -> print $ fiboIterative nsims
    _ -> putStrLn "unknown algo, try --help"

