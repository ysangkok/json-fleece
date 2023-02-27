{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.CompanyBase.VideoGameCompany
  ( VideoGameCompany(..)
  , videoGameCompanySchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype VideoGameCompany = VideoGameCompany Bool
  deriving (Show, Eq)

videoGameCompanySchema :: FC.Fleece schema => schema VideoGameCompany
videoGameCompanySchema =
  FC.coerceSchema FC.boolean