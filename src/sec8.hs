import Control.Monad
import Data.Char

-- main = do
--   print 2
--   print "hello"
--   print [1, 2, 3]

-- main = do
--   input <- getLine
--   when (input == "SWORDFISH") $ do putStrLn input

-- main = do
--   rs <- sequence [getLine, getLine, getLine]
--   print rs

-- ^ C to quit
--  main = forever $ do
--    putStr "Give me some input: "
--    l <- getLine
--    putStrLn $ map toUpper l

main = do
  colors <- forM [1, 2, 3, 4] $ \a -> do
    putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
    getLine
  putStrLn "The colors that you associate with 1,2,3,4 are: "
  mapM_ putStrLn colors
