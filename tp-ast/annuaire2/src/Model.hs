
{-# LANGUAGE OverloadedStrings #-}

module Model where

import Data.Map qualified as M
import Data.Text qualified as T

import Value

data Personne = Personne
    { _nom :: T.Text
    , _mail :: T.Text
    , _annee :: Int
    -- , _adresse :: Adresse
    -- , _loisirs :: [T.Text]
    }

-- TODO instance de ToValue pour Personne

-- TODO Adresse

