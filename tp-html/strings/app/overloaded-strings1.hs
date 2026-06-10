
data Person = MkPerson 
  { _firstname :: String
  , _lastname :: String
  } deriving (Show)

persons :: [Person]
persons = 
  [ MkPerson "John" "Doe"
  , MkPerson "Haskell" "Curry"
  ]

main :: IO ()
main = print persons

