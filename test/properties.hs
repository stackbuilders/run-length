----------------------------------------------------------------------
-- |
-- Module: Main
--
--
-- Properties.
--
----------------------------------------------------------------------

module Main
  ( main
  )
  where

-- run-length
import RunLength
  ( decode
  , encode
  )

-- QuickCheck
import Test.QuickCheck
  ( choose
  , elements
  , forAll
  , Gen
  , quickCheck
  , suchThat
  , vectorOf
  )


-- |
--
-- Run the properties.

main :: IO ()
main = do
  putStr "decode . encode == id: "
  quickCheck $
    forAll decodedString $
      \xs -> decode (encode xs) == xs

  putStr "encode . decode == id: "
  quickCheck $
    forAll encodedString $
      \xs -> encode (decode xs) == xs


-- |
--
-- Generate a run-length encoded string.

encodedString :: Gen [(Int, Char)]
encodedString = do
  m <- choose (0, 11)
  n <- choose (1, 5)
  char <- elements ['a'..'z']
  encodedString' m char [(n, char)]
  where
    encodedString' :: Int -> Char -> [(Int, Char)] -> Gen [(Int, Char)]
    encodedString' 0 _ xs =
      return xs
    encodedString' m previousChar xs = do
      n <- choose (1, 5)
      char <- elements ['a'..'z'] `suchThat` (/= previousChar)
      encodedString' (m - 1) char ((n, char):xs)


-- |
--
-- Generate a run-length decoded string.

decodedString :: Gen String
decodedString = do
  m <- choose (0, 10)
  fmap concat $
    vectorOf m $ do
      n <- choose (1, 5)
      char <- elements ['a'..'z']
      vectorOf n (return char)


