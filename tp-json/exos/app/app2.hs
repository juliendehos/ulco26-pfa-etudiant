
{-# LANGUAGE OverloadedStrings #-}

import Data.Aeson
import Data.ByteString.Char8 qualified as B
import Data.ByteString.Lazy.Char8 qualified as L
import Data.Text as T
import Data.Text.Read as T
import Data.Yaml qualified as Y

-------------------------------------------------------------------------------
-- Formation
-------------------------------------------------------------------------------

data Formation = Formation
  { _ecole :: Text
  , _pays :: Text
  }

-- TODO FromJSON

-- TODO ToJSON

-------------------------------------------------------------------------------
-- Personne
-------------------------------------------------------------------------------

data Personne = Personne
  { _nom :: Text
  , _annee :: Text
  , _formations :: [Formation]
  }

-- TODO FromJSON

-- TODO ToJSON

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

main :: IO ()
main = do
    -- TODO
    pure ()

