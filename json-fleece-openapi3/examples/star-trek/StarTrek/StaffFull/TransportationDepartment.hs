{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.StaffFull.TransportationDepartment
  ( TransportationDepartment(..)
  , transportationDepartmentSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype TransportationDepartment = TransportationDepartment Bool
  deriving (Show, Eq)

transportationDepartmentSchema :: FC.Fleece schema => schema TransportationDepartment
transportationDepartmentSchema =
  FC.coerceSchema FC.boolean