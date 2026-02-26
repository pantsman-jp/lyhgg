-- main = do
--   contents <- getContents
--   putStr $ shortLineOnly contents

main = interact shortLineOnly

shortLineOnly :: String -> String
shortLineOnly = unlines . filter (\line -> length line < 10) . lines
