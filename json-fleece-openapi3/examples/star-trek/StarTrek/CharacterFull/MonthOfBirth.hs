{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.CharacterFull.MonthOfBirth
  ( MonthOfBirth(..)
  , monthOfBirthSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype MonthOfBirth = MonthOfBirth Integer
  deriving (Show, Eq)

monthOfBirthSchema :: FC.Fleece schema => schema MonthOfBirth
monthOfBirthSchema =
  FC.coerceSchema FC.integer