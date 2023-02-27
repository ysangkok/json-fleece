{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.BookBase.ReferenceBook
  ( ReferenceBook(..)
  , referenceBookSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype ReferenceBook = ReferenceBook Bool
  deriving (Show, Eq)

referenceBookSchema :: FC.Fleece schema => schema ReferenceBook
referenceBookSchema =
  FC.coerceSchema FC.boolean