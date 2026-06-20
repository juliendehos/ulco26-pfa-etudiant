
{-# LANGUAGE OverloadedStrings #-}

module Json where

import Data.Map qualified as M
import Data.Text qualified as T

import Value

export :: Value -> T.Text
export (VNumber x) = T.show x
export (VString x) = "\"" <> x <> "\""
export (VArray xs) = "[" <> T.intercalate ", " (map export xs) <> "]"
export (VObject kvs) = "{" <> T.intercalate ", " (map fmtField $ M.toList kvs) <> "}"
    where
        fmtField (k, v) = "\"" <> k <> "\": " <> export v

