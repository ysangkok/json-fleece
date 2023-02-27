{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.LocationBaseResponse
  ( LocationBaseResponse(..)
  , locationBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.LocationBase (LocationBase, locationBaseSchema)
import StarTrek.ResponsePage (ResponsePage, responsePageSchema)
import StarTrek.ResponseSort (ResponseSort, responseSortSchema)

data LocationBaseResponse = LocationBaseResponse
  { sort :: Maybe ResponseSort -- ^ Response sort
  , page :: Maybe ResponsePage -- ^ Object describing response page
  , locations :: Maybe [LocationBase] -- ^ Base location, returned in search results
  }
  deriving (Eq, Show)

locationBaseResponseSchema :: FC.Fleece schema => schema LocationBaseResponse
locationBaseResponseSchema =
  FC.object $
    FC.constructor LocationBaseResponse
      #+ FC.optional "sort" sort responseSortSchema
      #+ FC.optional "page" page responsePageSchema
      #+ FC.optional "locations" locations (FC.list locationBaseSchema)