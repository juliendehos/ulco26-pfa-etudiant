
import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Cairo
import System.Random

import Mcpi1
-- import Mcpi2

main :: IO ()
main = do
  vs <- zip [1::Double ..] . computePis 500 <$> getStdGen
  toFile opts "output.svg" $ do
    -- layout_title .= "Monte Carlo Pi"
    layout_title_style . font_size .= 18
    layout_title_style . font_weight .= FontWeightNormal
    layout_background .= solidFillStyle transparent
    layout_x_axis . laxis_style . axis_label_style . font_size .= 12
    layout_x_axis . laxis_title .= "nsims"
    layout_y_axis . laxis_style . axis_label_style . font_size .= 12
    layout_y_axis . laxis_generate .= scaledAxis def (0, 4)
    layout_y_axis . laxis_title .= "estimated pi"
    plot (line "" [vs])
  where
    opts = FileOptions (400, 300) SVG

