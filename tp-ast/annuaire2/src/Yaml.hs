
{-# LANGUAGE OverloadedStrings #-}

module Yaml where

import Data.Map qualified as M
import Data.Text qualified as T

import Value

export :: Value -> T.Text
export = go ""
  where
    go indent value = case value of
        VNumber x -> T.show x
        VString x -> x
        VArray xs -> T.concat $ map (fmtArray indent) xs
        VObject kvs -> T.concat (map (fmtObject indent) $ M.toList kvs)

    fmtArray i v = "\n" <> i <> "- " <> go (i <> "  ") v
    fmtObject i (k, v) = "\n" <> i <> k <> ": " <> go (i <> "  ") v

