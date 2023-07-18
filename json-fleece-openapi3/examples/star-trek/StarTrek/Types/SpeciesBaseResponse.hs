{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.SpeciesBaseResponse
  ( SpeciesBaseResponse(..)
  , speciesBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.ResponsePage as ResponsePage
import qualified StarTrek.Types.ResponseSort as ResponseSort
import qualified StarTrek.Types.SpeciesBase as SpeciesBase

data SpeciesBaseResponse = SpeciesBaseResponse
  { species :: Maybe [SpeciesBase.SpeciesBase] -- ^ Base species, returned in search results
  , page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  , sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  }
  deriving (Eq, Show)

speciesBaseResponseSchema :: FC.Fleece schema => schema SpeciesBaseResponse
speciesBaseResponseSchema =
  FC.object $
    FC.constructor SpeciesBaseResponse
      #+ FC.optional "species" species (FC.list SpeciesBase.speciesBaseSchema)
      #+ FC.optional "page" page ResponsePage.responsePageSchema
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema