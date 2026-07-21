
{-# LANGUAGE OverloadedStrings #-}

module View where

import Lucid
import Data.Text as T
import Data.Text.Lazy as L

myRender :: Html () -> L.Text
myRender = renderText

myStyle :: T.Text
myStyle = 
  " body {background-color: pink;} "

mkPage :: Integer -> Html ()
mkPage c = 
  doctypehtml_ $ do

    head_ $ do
      meta_ [charset_ "utf-8"]
      title_ "web-counter"
      style_ myStyle

    body_ $ do
       h1_ "web-counter"
       p_ $ "counter = " <> toHtml (L.show c)
       div_ $ do
         form_ [action_ "/inc", method_ "post"] $ 
           input_ [type_ "submit", value_ "increment"]
         form_ [action_ "/dec", method_ "post"] $ 
           input_ [type_ "submit", value_ "decrement"]

