----------------------------------------------------------------------
-- |
-- Module: Main
--
--
-- Examples.
--
----------------------------------------------------------------------

module Main
  ( main
  )
  where

-- doctest
import Test.DocTest (doctest)


-- |
--
-- Run the examples.

main :: IO ()
main =
  doctest ["src/RunLength.hs"]
