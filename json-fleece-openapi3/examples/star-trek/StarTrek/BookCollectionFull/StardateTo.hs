{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.BookCollectionFull.StardateTo
  ( StardateTo(..)
  , stardateToSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Float, Show)

newtype StardateTo = StardateTo Float
  deriving (Show, Eq)

stardateToSchema :: FC.Fleece schema => schema StardateTo
stardateToSchema =
  FC.coerceSchema FC.float