
{-# LANGUAGE OverloadedStrings #-}

import Data.Aeson
import Data.ByteString.Char8 qualified as B
import Data.ByteString.Lazy.Char8 qualified as L
import Data.Text
import Data.Yaml qualified as Y
import GHC.Generics

-------------------------------------------------------------------------------
-- Education
-------------------------------------------------------------------------------

data Education = Education
  { univ :: Text
  , country :: Text
  } 

-- TODO FromJSON

-- TODO ToJSON

-------------------------------------------------------------------------------
-- Person
-------------------------------------------------------------------------------

data Person = Person
  { name :: Text
  , year :: Int
  , haskeller :: Bool
  , education :: [Education]
  }

-- TODO FromJSON

-- TODO ToJSON

-------------------------------------------------------------------------------
-- main
-------------------------------------------------------------------------------

main :: IO ()
main = do

    putStrLn "\n*** person_yaml ***"
    -- TODO

    putStrLn "\n*** persons_yaml ***"
    -- TODO

    putStrLn "\n*** ko_yaml ***"
    -- TODO

    putStrLn "\n*** person_json ***"
    -- TODO

    putStrLn "\n*** persons_json ***"
    -- TODO

    putStrLn "\n*** ko_json ***"
    -- TODO

