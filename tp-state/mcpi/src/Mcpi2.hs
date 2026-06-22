
-- Module de calcul de pi par la méthode de Monte-Carlo (pi = 4 * d/n).
module Mcpi2 
  ( computePi
  , computePis
  ) where

import Control.Monad
import Control.Monad.Trans.State
import System.Random

-- Calcule la valeur de d correspondant au point (x,y).
xy2d :: Double -> Double -> Int
xy2d x y = if x*x + y*y <= 1 then 1 else 0

-- Retourne un nombre aléatoire dans [0,1].
-- TODO sample01 :: State StdGen Double

-- Retourne une valeur aléatoire de d.
-- TODO sampleD

-- Retourne k valeurs aléatoires de d.
-- TODO samplesD

-- Estimation de pi.
computePi :: Int -> StdGen -> Double
computePi k g = 0
  -- TODO

-- Estimation de pi, avec les résultats intermédiaires.
computePis :: Int -> StdGen -> [Double]
computePis k g = []
  -- TODO

