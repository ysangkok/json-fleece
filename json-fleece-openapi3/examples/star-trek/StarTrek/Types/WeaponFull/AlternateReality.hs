{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.WeaponFull.AlternateReality
  ( AlternateReality(..)
  , alternateRealitySchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype AlternateReality = AlternateReality Bool
  deriving (Show, Eq)

alternateRealitySchema :: FC.Fleece schema => schema AlternateReality
alternateRealitySchema =
  FC.coerceSchema FC.boolean