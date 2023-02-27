{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.WeaponFull.PhaserTechnology
  ( PhaserTechnology(..)
  , phaserTechnologySchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype PhaserTechnology = PhaserTechnology Bool
  deriving (Show, Eq)

phaserTechnologySchema :: FC.Fleece schema => schema PhaserTechnology
phaserTechnologySchema =
  FC.coerceSchema FC.boolean