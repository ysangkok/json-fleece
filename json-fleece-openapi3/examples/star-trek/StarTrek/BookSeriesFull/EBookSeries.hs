{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.BookSeriesFull.EBookSeries
  ( EBookSeries(..)
  , eBookSeriesSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype EBookSeries = EBookSeries Bool
  deriving (Show, Eq)

eBookSeriesSchema :: FC.Fleece schema => schema EBookSeries
eBookSeriesSchema =
  FC.coerceSchema FC.boolean