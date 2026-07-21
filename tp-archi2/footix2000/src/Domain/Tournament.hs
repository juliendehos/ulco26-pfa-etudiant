
module Domain.Tournament where

import Data.Text

import Domain.Country

data Tournament = Tournament
  { _name :: Text
  , _winner :: Country
  }

