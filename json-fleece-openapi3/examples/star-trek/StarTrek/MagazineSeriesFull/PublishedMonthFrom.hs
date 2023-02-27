{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MagazineSeriesFull.PublishedMonthFrom
  ( PublishedMonthFrom(..)
  , publishedMonthFromSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype PublishedMonthFrom = PublishedMonthFrom Integer
  deriving (Show, Eq)

publishedMonthFromSchema :: FC.Fleece schema => schema PublishedMonthFrom
publishedMonthFromSchema =
  FC.coerceSchema FC.integer