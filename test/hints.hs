----------------------------------------------------------------------
-- |
-- Module: Main
--
--
-- Hints.
--
----------------------------------------------------------------------

module Main
  ( main
  )
  where

-- base
import Control.Monad (unless)
import System.Exit (exitFailure)

-- hlint
import Language.Haskell.HLint3 (hlint)


-- |
--
-- Run the hints.

main :: IO ()
main = do
  hints <-
    hlint
      [ "src"
      , "test"
      ]
  unless (null hints) exitFailure
