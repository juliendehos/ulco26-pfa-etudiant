
module Value where

import Data.Map qualified as M
import Data.Text qualified as T

-------------------------------------------------------------------------------
-- Value
-------------------------------------------------------------------------------

data Value
  = VNumber Int
  | VString T.Text
  | VArray [Value]
  | VObject (M.Map T.Text Value)

-------------------------------------------------------------------------------
-- ToValue
-------------------------------------------------------------------------------

-- TODO class ToValue 

-- TODO instance pour Int

-- TODO instance pour T.Text

-- TODO instance les listes

