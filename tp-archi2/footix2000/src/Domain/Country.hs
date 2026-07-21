
module Domain.Country where

import Data.Text

newtype Country = Country
  { _name :: Text
  }

