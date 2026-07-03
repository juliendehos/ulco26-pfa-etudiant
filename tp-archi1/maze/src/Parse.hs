
module Parse where

import Data.Text qualified as T
import Data.Text.IO qualified as T
import Data.Vector qualified as V

import Maze

char2cell :: Char -> Cell
char2cell c = case c of
  '+' -> CellWall
  '?' -> CellTarget
  _   -> CellEmpty

parseMaze :: T.Text -> Either String Maze
parseMaze input = 
  case T.lines input of
    [] -> Left "no cells"
    (r:rs) ->
      let ni' = 1 + length rs
          nj' = T.length r
          raw = V.fromList $ T.unpack $ r <> T.concat rs
      in case V.findIndex (=='o') raw of
        Nothing -> Left "no player"
        Just k ->
          let cells' = fmap char2cell raw
              i' = div k nj'
              j' = rem k nj' 
          in Right $ mkMaze ni' nj' i' j' cells'

readMaze :: FilePath -> IO (Either String Maze)
readMaze fp = parseMaze <$> T.readFile fp

