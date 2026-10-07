
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE TypeOperators #-}

module Movie where

import Data.Aeson
import Data.Bool
import Database.Selda
import Database.Selda.SQLite

----------------------------------------------------------------------
-- Movie
----------------------------------------------------------------------

-- TODO

----------------------------------------------------------------------
-- Person
----------------------------------------------------------------------

-- TODO

----------------------------------------------------------------------
-- Role
----------------------------------------------------------------------

-- TODO

----------------------------------------------------------------------
-- Prod
----------------------------------------------------------------------

-- TODO

----------------------------------------------------------------------
-- ProdInfo
----------------------------------------------------------------------

{-
type ProdInfo = Movie :*: Person :*: Role

instance ToJSON a => ToJSON (ID a) where
    toJSON i = toJSON (fromId i)
    toEncoding i = toEncoding (fromId i)

instance ToJSON ProdInfo where
    toJSON (m :*: p :*: r) = object 
      [ "movie" .= toJSON m
      , "person" .= toJSON p
      , "role" .= toJSON r
      ]

    toEncoding (m :*: p :*: r) =  pairs 
      (  "movie" .= m
      <> "person" .= p
      <> "role" .= r
      )
-}

----------------------------------------------------------------------
-- queries
----------------------------------------------------------------------

-- TODO selectAllMovies

-- TODO selectAllProds

-- TODO selectMoviesFromPersonId

----------------------------------------------------------------------
-- init
----------------------------------------------------------------------

printStatus :: String -> Bool -> IO ()
printStatus status res = putStrLn $ status <> ": " <> bool "KO" "OK" res

{-
initDb :: SeldaT SQLite IO ()
initDb = do

    tryDropTable prod_table
    tryDropTable movie_table
    tryDropTable person_table
    tryDropTable role_table

    createTable movie_table
    tryInsert movie_table
        [ Movie def "Bernie" 1996
        , Movie def "Le Kid" 1921 
        , Movie def "Metropolis" 1927
        , Movie def "Citizen Kane" 1941
        , Movie def "Les Temps Modernes" 1936
        ] >>= liftIO . printStatus "movie"

    createTable person_table
    tryInsert person_table
        [ Person def "Orson Welles"
        , Person def "Charlie Chaplin"
        , Person def "Albert Dupontel"
        , Person def "Claude Perron"
        , Person def "Alfred Abel"
        , Person def "Fritz Lang"
        ] >>= liftIO . printStatus "person"

    createTable role_table
    tryInsert role_table
        [ Role def "Réalisateur"
        , Role def "Acteur"
        , Role def "Producteur"
        ] >>= liftIO . printStatus "role"

    createTable prod_table
    tryInsert prod_table
        [ Prod (toId 1) (toId 3) (toId 1)
        , Prod (toId 1) (toId 3) (toId 2)
        , Prod (toId 1) (toId 4) (toId 2)
        , Prod (toId 2) (toId 2) (toId 1)
        , Prod (toId 2) (toId 2) (toId 2)
        , Prod (toId 2) (toId 2) (toId 3)
        , Prod (toId 3) (toId 5) (toId 2)
        , Prod (toId 3) (toId 6) (toId 1)
        , Prod (toId 4) (toId 1) (toId 1)
        , Prod (toId 4) (toId 1) (toId 2)
        , Prod (toId 4) (toId 1) (toId 3)
        , Prod (toId 5) (toId 2) (toId 2)
        ] >>= liftIO . printStatus "prod"
-}

