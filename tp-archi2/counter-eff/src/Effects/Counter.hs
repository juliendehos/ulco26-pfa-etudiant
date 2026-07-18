
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Effects.Counter where

import Effectful
import Effectful.TH

data Counter :: Effect where
  GetCounter :: Counter m Integer

  -- TODO AddCounter 

makeEffect ''Counter

