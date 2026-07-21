
{-# LANGUAGE OverloadedStrings #-}

module Domain.Message where

import Data.Text as T

data Message = Message
  { _author :: Text
  , _body :: Text
  } 

checkMessage :: Message -> Bool
checkMessage (Message a b) = not (T.null a || T.null b)

fmtMessage :: Message -> Text
fmtMessage (Message a b) = T.unwords ["Message", a, b]

