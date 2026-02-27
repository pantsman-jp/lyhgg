import Data.Char
import Data.List

-- main = do
--   line <- fmap reverse getLine
--   putStrLn $ "You said " ++ line ++ " backwards!"
--   putStrLn $ "Yesm you really said " ++ line ++ " backwards"

-- main = do
--   line <- fmap (intersperse '-' . reverse . map toUpper) getLine
--   putStrLn line

data CMaybe a = CNothing | CJust Int a deriving (Show)

-- fmap id (CJust 0 "haha") != id (CJust 0 "haha")
instance Functor CMaybe where
  fmap f CNothing = CNothing
  fmap f (CJust counter x) = CJust (counter + 1) (f x)
