
{-# LANGUAGE OverloadedStrings #-}

module Applications.Html where

import Control.Monad
import Lucid
import Data.Text as T
import Data.Text.Lazy as L

import Domain.Country
import Domain.Tournament

myRender :: Html () -> L.Text
myRender = renderText

myStyle :: T.Text
myStyle = 
  " body {background-color: lightgreen;} \
  \ table {border-collapse: collapse;} \
  \ td {border: 1px solid black; padding-left: 5px; padding-right: 5px} "

mkPage :: [(Country, Int)] -> [Tournament] -> Html ()
mkPage winners tournaments = 
  doctypehtml_ $ do

    head_ $ do
      meta_ [charset_ "utf-8"]
      title_ "Footix 2000"
      style_ myStyle

    body_ $ do
      h1_ "Footix 2000"

      h2_ "API"
      ul_ $ do
        li_ $ a_ [href_ "/api/countries"] "countries"
        li_ $ a_ [href_ "/api/wins/france"] "wins/france"
        li_ $ a_ [href_ "/api/wins/united states"] "wins/united states"
        li_ $ a_ [href_ "/api/wins/bretagne"] "wins/bretagne"

      h2_ "Winners"
      -- TODO

      h2_ "Tournaments"
      -- TODO

