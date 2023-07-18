{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.SeriesBaseResponse
  ( SeriesBaseResponse(..)
  , seriesBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.ResponsePage as ResponsePage
import qualified StarTrek.Types.ResponseSort as ResponseSort
import qualified StarTrek.Types.SeriesBase as SeriesBase

data SeriesBaseResponse = SeriesBaseResponse
  { series :: Maybe [SeriesBase.SeriesBase] -- ^ Base series, returned in search results
  , page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  , sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  }
  deriving (Eq, Show)

seriesBaseResponseSchema :: FC.Fleece schema => schema SeriesBaseResponse
seriesBaseResponseSchema =
  FC.object $
    FC.constructor SeriesBaseResponse
      #+ FC.optional "series" series (FC.list SeriesBase.seriesBaseSchema)
      #+ FC.optional "page" page ResponsePage.responsePageSchema
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema