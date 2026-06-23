
{-# LANGUAGE OverloadedStrings #-}

module Monoid.Html where

import Data.Text.Lazy qualified as L

newtype Html = Html { unHtml :: L.Text }
  deriving (Semigroup, Monoid)

render :: Html -> L.Text
render = unHtml

-- TODO makeElement :: L.Text -> Html -> Html

-- TODO toHtml :: L.Text -> Html

-- TODO html_ :: Html -> Html

-- TODO body_ :: Html -> Html

-- TODO h1_ :: Html -> Html

-- TODO ul_ :: Html -> Html

-- TODO li_ :: Html -> Html

-- TODO mkPage :: [L.Text] -> Html

