----------------------------------------------------------------------
-- |
-- Module: RunLength
--
--
-- Run-length encoding.
--
----------------------------------------------------------------------

module RunLength
  ( decode
  , encode
  )
  where


-- |
--
-- Decode a run-length encoded list to a list.
--
-- >>> decode [(5,'a'),(4,'e'),(3,'i'),(2,'o'),(1,'u')]
-- "aaaaaeeeeiiioou"

decode
  :: [(Int, a)]
  -> [a]
decode =
  undefined


-- |
--
-- Encode a list to a run-length encoded list.
--
-- >>> encode "aaaaaeeeeiiioou"
-- [(5,'a'),(4,'e'),(3,'i'),(2,'o'),(1,'u')]

encode
  :: Eq a
  => [a]
  -> [(Int, a)]
encode =
  undefined
