{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.AnimalBase.Feline
  ( Feline(..)
  , felineSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype Feline = Feline Bool
  deriving (Show, Eq)

felineSchema :: FC.Fleece schema => schema Feline
felineSchema =
  FC.coerceSchema FC.boolean