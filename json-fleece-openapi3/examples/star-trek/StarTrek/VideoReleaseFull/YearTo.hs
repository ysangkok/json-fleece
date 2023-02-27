{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.VideoReleaseFull.YearTo
  ( YearTo(..)
  , yearToSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype YearTo = YearTo Integer
  deriving (Show, Eq)

yearToSchema :: FC.Fleece schema => schema YearTo
yearToSchema =
  FC.coerceSchema FC.integer