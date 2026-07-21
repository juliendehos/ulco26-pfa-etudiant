
module Interpreters.DbSelda where

-------------------------------------------------------------------------------
-- Country
-------------------------------------------------------------------------------

-- TODO data DbCountry 

-- TODO toCountry :: DbCountry -> Country

-------------------------------------------------------------------------------
-- Tournament
-------------------------------------------------------------------------------

-- TODO data DbTournament 

-- TODO toTournament :: DbTournament -> DbCountry -> Tournament

-------------------------------------------------------------------------------
-- runSelda
-------------------------------------------------------------------------------

-- TODO runDbSelda 


{-

  DbReset -> do
    logInfo_ "DbSelda.DbReset"
    flip runSeldaT conn $ do
      tryDropTable tournamentTable
      tryDropTable countryTable
      createTable countryTable
      createTable tournamentTable

      ok1 <- tryInsert countryTable
        [ DbCountry (toId  1) "Uruguay"
        , DbCountry (toId  2) "Italy"
        , DbCountry (toId  3) "West Germany"
        , DbCountry (toId  4) "Brazil"
        , DbCountry (toId  5) "England"
        , DbCountry (toId  6) "Argentina"
        , DbCountry (toId  7) "United States"
        , DbCountry (toId  8) "Norway"
        , DbCountry (toId  9) "France"
        , DbCountry (toId 10) "Germany"
        , DbCountry (toId 11) "Spain"
        ]
      if ok1
        then lift $ logInfo_ "insert countries ok"
        else lift $ logAttention_ "insert countries ko"

      ok2 <- tryInsert tournamentTable
        [ DbTournament def "1930 FIFA Men's World Cup"   (toId  1)
        , DbTournament def "1934 FIFA Men's World Cup"   (toId  2)
        , DbTournament def "1938 FIFA Men's World Cup"   (toId  2)
        , DbTournament def "1950 FIFA Men's World Cup"   (toId  1)
        , DbTournament def "1954 FIFA Men's World Cup"   (toId  3)
        , DbTournament def "1958 FIFA Men's World Cup"   (toId  4)
        , DbTournament def "1962 FIFA Men's World Cup"   (toId  4)
        , DbTournament def "1966 FIFA Men's World Cup"   (toId  5)
        , DbTournament def "1970 FIFA Men's World Cup"   (toId  4)
        , DbTournament def "1974 FIFA Men's World Cup"   (toId  3)
        , DbTournament def "1978 FIFA Men's World Cup"   (toId  6)
        , DbTournament def "1982 FIFA Men's World Cup"   (toId  2)
        , DbTournament def "1986 FIFA Men's World Cup"   (toId  6)
        , DbTournament def "1990 FIFA Men's World Cup"   (toId  3)
        , DbTournament def "1991 FIFA Women's World Cup" (toId  7)
        , DbTournament def "1994 FIFA Men's World Cup"   (toId  4)
        , DbTournament def "1995 FIFA Women's World Cup" (toId  8)
        , DbTournament def "1998 FIFA Men's World Cup"   (toId  9)
        , DbTournament def "1999 FIFA Women's World Cup" (toId  7)
        , DbTournament def "2002 FIFA Men's World Cup"   (toId  4)
        , DbTournament def "2003 FIFA Women's World Cup" (toId 10)
        , DbTournament def "2006 FIFA Men's World Cup"   (toId  2)
        , DbTournament def "2007 FIFA Women's World Cup" (toId 10)
        , DbTournament def "2010 FIFA Men's World Cup"   (toId 11)
        , DbTournament def "2011 FIFA Women's World Cup" (toId  4)
        , DbTournament def "2014 FIFA Men's World Cup"   (toId 10)
        , DbTournament def "2015 FIFA Women's World Cup" (toId  7)
        , DbTournament def "2018 FIFA Men's World Cup"   (toId  9)
        , DbTournament def "2019 FIFA Women's World Cup" (toId  7)
        , DbTournament def "2022 FIFA Men's World Cup"   (toId  6)
        , DbTournament def "2023 FIFA Women's World Cup" (toId 11)
        , DbTournament def "2026 FIFA Men's World Cup"   (toId 11)
        ]
      if ok2
        then lift $ logInfo_ "insert tournaments ok"
        else lift $ logAttention_ "insert tournaments ko"

-}

