
{-# LANGUAGE OverloadedStrings #-}

module Json (export) where

import Data.Text qualified as T

import Model

exportInt :: Int -> T.Text
exportInt = T.show

exportText :: T.Text -> T.Text
exportText txt = "\"" <> txt <> "\""

exportTexts :: [T.Text] -> T.Text
exportTexts txts = "[" <> T.intercalate "," (map exportText txts) <> "]"

exportPersonne :: Personne -> T.Text
exportPersonne (Personne n m a) =
    "{\"name\": " <> exportText n <> 
    ",\"mail\": " <> exportText m <> 
    ",\"year\": " <> exportInt a <>
    "}"

export :: [Personne] -> T.Text
export ps = "[" <> T.intercalate ", " (map exportPersonne ps) <> "]"

