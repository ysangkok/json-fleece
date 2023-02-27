{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.PerformerFull.VoyPerformer
  ( VoyPerformer(..)
  , voyPerformerSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype VoyPerformer = VoyPerformer Bool
  deriving (Show, Eq)

voyPerformerSchema :: FC.Fleece schema => schema VoyPerformer
voyPerformerSchema =
  FC.coerceSchema FC.boolean