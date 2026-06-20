
{-# LANGUAGE OverloadedStrings #-}

module Yaml where

import Data.Text qualified as T

import Model

exportTexts :: T.Text -> [T.Text] -> T.Text
exportTexts indent txts = foldl fmt "" txts
  where
    fmt acc txt = acc <> "\n" <> indent <> "- " <> txt 

exportPersonne :: T.Text -> Personne -> T.Text
exportPersonne indent (Personne n m a) =
  "\n" <> indent <> "name: " <> n <>
  "\n" <> indent <> "mail: " <> m <>
  "\n" <> indent <> "year: " <> T.show a

export :: [Personne] -> T.Text
export xs = 
  T.unlines $ map (\v -> "- " <> exportPersonne "  " v) xs

