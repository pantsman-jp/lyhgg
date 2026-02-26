-- section 8
-- src % ghc --make helloworld
main = do
  -- putStrLn "hello, world!"
  putStrLn "Hello, what's your name?"
  name <- getLine
  putStrLn $ "Hey " ++ name ++ ", you rock!"
