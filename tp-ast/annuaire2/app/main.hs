
{-# LANGUAGE OverloadedStrings #-}

import Data.Text.IO qualified as T

import Json
import Model
import Value
import Yaml

annuaire :: [Personne]
annuaire =
    [ Personne 
        "john doe"
        "john@doe.com"
        1942
        -- (Adresse 42 "rue de la mer" 69000 "Lyon")
        -- ["aquaponey", "vélo"]
    , Personne
        "foo bar"
        "foobar@neutronmail.com"
        1337
        -- (Adresse 1337 "rue de la montagne" 62100 "Calais")
        -- []
    ]

main :: IO ()
main = do
    pure ()
    -- TODO export json
    -- TODO export yaml

