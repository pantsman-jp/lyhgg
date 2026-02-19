-- multThree :: Int -> Int -> Int -> Int
-- multThree :: Int -> (Int -> (Int -> Int))

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) = quicksort (filter (<= x) xs) ++ [x] ++ quicksort (filter (> x) xs)

largestDivisible :: Integer -> Integer -> Integer
largestDivisible n m = head (filter p [n, (n - 1) ..])
  where
    p x = x `mod` m == 0

chain :: Integer -> [Integer]
chain 1 = [1]
chain n
  | even n = n : chain (div n 2)
  | odd n = n : chain (3 * n + 1)

numLongChains :: Integer -> Int -> Int
numLongChains n m = length (filter (\xs -> length xs > m) (map chain [1 .. n]))

myfoldl :: (b -> a -> b) -> b -> [a] -> b
myfoldl _ x [] = x
myfoldl f x (y : ys) = myfoldl f (f x y) ys

sum' :: (Num a) => [a] -> a
sum' = myfoldl (+) 0

myfoldr :: (a -> b -> b) -> b -> [a] -> b
myfoldr _ x [] = x
myfoldr f x (y : ys) = f y (myfoldr f x ys)

map' :: (a -> b) -> [a] -> [b]
map' f = myfoldr (\x acc -> f x : acc) []

elem' :: (Eq a) => a -> [a] -> Bool
elem' y = myfoldr (\x acc -> if x == y then True else acc) False

myfoldl1 :: (a -> a -> a) -> [a] -> a
myfoldl1 f (x : xs) = myfoldl f x xs

myfoldr1 :: (a -> a -> a) -> [a] -> a
myfoldr1 f (x : xs) = myfoldr f x xs

maximum' :: (Ord a) => [a] -> a
maximum' = myfoldl1 max

reverse' :: [a] -> [a]
reverse' = myfoldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = myfoldl (*) 1

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = myfoldr (\x acc -> if p x then x : acc else acc) []

last' :: [a] -> a
last' = myfoldl1 (\_ x -> x)

and' :: [Bool] -> Bool
and' = myfoldr (&&) True
