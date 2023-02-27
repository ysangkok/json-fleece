{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.StaffBase.NovelAuthor
  ( NovelAuthor(..)
  , novelAuthorSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype NovelAuthor = NovelAuthor Bool
  deriving (Show, Eq)

novelAuthorSchema :: FC.Fleece schema => schema NovelAuthor
novelAuthorSchema =
  FC.coerceSchema FC.boolean