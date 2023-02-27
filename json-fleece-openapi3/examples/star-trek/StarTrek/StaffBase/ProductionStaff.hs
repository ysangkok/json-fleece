{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.StaffBase.ProductionStaff
  ( ProductionStaff(..)
  , productionStaffSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype ProductionStaff = ProductionStaff Bool
  deriving (Show, Eq)

productionStaffSchema :: FC.Fleece schema => schema ProductionStaff
productionStaffSchema =
  FC.coerceSchema FC.boolean