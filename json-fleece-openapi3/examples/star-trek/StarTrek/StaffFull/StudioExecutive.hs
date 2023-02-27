{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.StaffFull.StudioExecutive
  ( StudioExecutive(..)
  , studioExecutiveSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype StudioExecutive = StudioExecutive Bool
  deriving (Show, Eq)

studioExecutiveSchema :: FC.Fleece schema => schema StudioExecutive
studioExecutiveSchema =
  FC.coerceSchema FC.boolean