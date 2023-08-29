{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.LocationBaseResponse
  ( LocationBaseResponse(..)
  , locationBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.LocationBase as LocationBase
import qualified StarTrek.Types.ResponsePage as ResponsePage
import qualified StarTrek.Types.ResponseSort as ResponseSort

data LocationBaseResponse = LocationBaseResponse
  { page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  , locations :: Maybe [LocationBase.LocationBase] -- ^ Base location, returned in search results
  , sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  }
  deriving (Eq, Show)

locationBaseResponseSchema :: FC.Fleece schema => schema LocationBaseResponse
locationBaseResponseSchema =
  FC.object $
    FC.constructor LocationBaseResponse
      #+ FC.optional "page" page ResponsePage.responsePageSchema
      #+ FC.optional "locations" locations (FC.list LocationBase.locationBaseSchema)
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema