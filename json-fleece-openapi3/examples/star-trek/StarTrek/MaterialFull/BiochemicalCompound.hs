{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MaterialFull.BiochemicalCompound
  ( BiochemicalCompound(..)
  , biochemicalCompoundSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype BiochemicalCompound = BiochemicalCompound Bool
  deriving (Show, Eq)

biochemicalCompoundSchema :: FC.Fleece schema => schema BiochemicalCompound
biochemicalCompoundSchema =
  FC.coerceSchema FC.boolean