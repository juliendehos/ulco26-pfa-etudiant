
import Control.Monad

safeSqrt :: Double -> Maybe Double
safeSqrt x = 
  if x > 0 
    then Just (sqrt x) 
    else Nothing

safeMul2 :: Double -> Maybe Double
safeMul2 = Just . (*2)

myCompute :: Double -> Maybe (Double, Double)
myCompute x = do
  v1 <- safeSqrt x
  v2 <- safeMul2 v1
  pure (v2, x)

v :: Maybe Double
v = safeMul2 21

main :: IO ()
main = do
  print $ myCompute 441
  print $ myCompute (-4)
  print $ safeMul2 21
  print v

