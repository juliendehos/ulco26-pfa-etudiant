
module Model where

import Data.Text qualified as T

data Personne = Personne
    { _nom :: T.Text
    , _mail :: T.Text
    , _annee :: Int
    -- , _adresse :: Adresse
    -- , _loisirs :: [T.Text]
    }

