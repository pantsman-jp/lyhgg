import Data.Char
import Data.List
import Data.Map qualified as Map

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

wordsNums :: String -> [(String, Int)]
wordsNums = map (\ws -> (head ws, length ws)) . group . sort . words

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

-- Caesar cipher
encode :: Int -> String -> String
encode offset = map (\c -> chr $ ord c + offset)

decode :: Int -> String -> String
decode shift = encode (negate shift)

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1 ..]

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey _ [] = Nothing
findKey key xs = foldr (\(k, v) acc -> if key == k then Just v else acc) Nothing xs
