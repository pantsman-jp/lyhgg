import Data.List
import System.Environment

main = do
  args <- getArgs
  progName <- getProgName
  putStrLn "The argument are:"
  mapM_ putStrLn args
  putStrLn "The program name is:"
  putStrLn progName
