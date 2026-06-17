{-# LANGUAGE OverloadedStrings #-}

import Control.Monad
import Data.Aeson
import Data.Maybe
import Data.Text qualified as T
import Data.Text.Lazy
import GHC.Generics
import Lucid
import Network.Wai.Middleware.RequestLogger 
import Network.Wai.Middleware.Static 
import Web.Scotty

data Person = Person
    { _name :: Text
    , _year :: Int
    } deriving (Generic, Show)

instance ToJSON Person

add2 :: Integer -> Integer -> Integer
add2 = (+)

-- TODO
urls :: [T.Text]
urls = []

-- TODO
indexPage :: Html ()
indexPage =  pure ()

-- TODO
main :: IO ()
main = pure ()

