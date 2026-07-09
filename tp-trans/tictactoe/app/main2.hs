
module Main where

import Control.Monad ( forM_, when )
import Control.Monad.State
import System.IO ( hFlush, stdout )
import Text.Read ( readMaybe )

import Tictactoe

fmtCell :: Cell -> Char
fmtCell CellEmpty = '.'
fmtCell CellX = 'X'
fmtCell CellO = 'O'

fmtStatus :: Status -> String
fmtStatus StatusXPlay = "X play"
fmtStatus StatusOPlay = "O play"
fmtStatus StatusXWin = "X win"
fmtStatus StatusOWin = "O win"
fmtStatus StatusTie = "tie"

-- TODO

main :: IO ()
main = pure ()

