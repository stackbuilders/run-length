----------------------------------------------------------------------
-- |
-- Module: Main
--
--
-- Specs.
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

-- hspec
import Test.Hspec
  ( describe
  , hspec
  , it
  , shouldBe
  )


-- |
--
-- Run the specs.

main :: IO ()
main =
  hspec $ do
    let
      decodedVowels = "aeiou"
      encodedVowels = [(1,'a'),(1,'e'),(1,'i'),(1,'o'),(1,'u')]

      decodedVooowels = "aaaaaeeeeiiioou"
      encodedVooowels = [(5,'a'),(4,'e'),(3,'i'),(2,'o'),(1,'u')]

    describe "decodes run-length encoded lists to lists" $ do
      it "decodes an empty list" $
        decode [] `shouldBe` ""

      it "decodes vowels (aeiou)" $
        decode encodedVowels `shouldBe` decodedVowels

      it "decodes vooowels (aaaaaeeeeiiioou)" $
        decode encodedVooowels `shouldBe` decodedVooowels

    describe "encodes lists to run-length encoded lists" $ do
      it "encodes an empty list" $
        encode "" `shouldBe` []

      it "encodes vowels (aeiou)" $
        encode decodedVowels `shouldBe` encodedVowels

      it "encodes vooowels (aaaaaeeeeiiioou)" $
        encode decodedVooowels `shouldBe` encodedVooowels

    describe "there and back again" $ do
      it "decode . encode == id" $
        decode (encode decodedVooowels) `shouldBe` decodedVooowels

      it "encode . decode == id" $
        encode (decode encodedVooowels) `shouldBe` encodedVooowels
