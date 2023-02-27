{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.AnimalBase.EarthAnimal
  ( EarthAnimal(..)
  , earthAnimalSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype EarthAnimal = EarthAnimal Bool
  deriving (Show, Eq)

earthAnimalSchema :: FC.Fleece schema => schema EarthAnimal
earthAnimalSchema =
  FC.coerceSchema FC.boolean