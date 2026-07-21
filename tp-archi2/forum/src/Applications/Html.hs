
{-# LANGUAGE OverloadedStrings #-}

module Applications.Html where

import Control.Monad
import Lucid
import Data.Text as T
import Data.Text.Lazy as L

import Domain.Message

myRender :: Html () -> L.Text
myRender = renderText

myStyle :: T.Text
myStyle = 
  " body {background-color: lightblue;} "

mkPage :: [Message] -> Html ()
mkPage messages = 
  doctypehtml_ $ do

    head_ $ do
      meta_ [charset_ "utf-8"]
      title_ "Forum"
      style_ myStyle

    body_ $ do
      h1_ "Forum"

      h2_ "Messages"
      p_ "TODO"

      h2_ "Add message"
      form_ [action_ "/add", method_ "post"] $ do
        p_ "TODO"
        p_ $ 
          input_ [type_ "submit", value_ "send"]

