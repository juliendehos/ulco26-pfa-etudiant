
{-# LANGUAGE OverloadedStrings #-}

module State.Html where

import Control.Monad
import Control.Monad.Trans.State
import Data.Text.Lazy qualified as L

newtype Html a = Html { unHtml :: State L.Text a }
  deriving (Functor, Applicative, Monad)

-- TODO render :: Html a -> L.Text

write :: L.Text-> Html ()
write txt = Html (modify' (<> txt))

-- TODO toHtml :: L.Text -> Html ()

-- TODO makeElement :: L.Text -> Html a -> Html a

-- TODO html_ :: Html a -> Html a

-- TODO body_ :: Html a -> Html a

-- TODO h1_ :: Html a -> Html a

-- TODO ul_ :: Html a -> Html a

-- TODO li_ :: Html a -> Html a

-- TODO mkPage :: [L.Text] -> Html ()

