{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.MovieBaseResponse
  ( MovieBaseResponse(..)
  , movieBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.MovieBase as MovieBase
import qualified StarTrek.Types.ResponsePage as ResponsePage
import qualified StarTrek.Types.ResponseSort as ResponseSort

data MovieBaseResponse = MovieBaseResponse
  { page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  , movies :: Maybe [MovieBase.MovieBase] -- ^ Base movie, returned in search results
  , sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  }
  deriving (Eq, Show)

movieBaseResponseSchema :: FC.Fleece schema => schema MovieBaseResponse
movieBaseResponseSchema =
  FC.object $
    FC.constructor MovieBaseResponse
      #+ FC.optional "page" page ResponsePage.responsePageSchema
      #+ FC.optional "movies" movies (FC.list MovieBase.movieBaseSchema)
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema