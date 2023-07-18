{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.PerformerBaseResponse
  ( PerformerBaseResponse(..)
  , performerBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.PerformerBase as PerformerBase
import qualified StarTrek.Types.ResponsePage as ResponsePage
import qualified StarTrek.Types.ResponseSort as ResponseSort

data PerformerBaseResponse = PerformerBaseResponse
  { performers :: Maybe [PerformerBase.PerformerBase] -- ^ Base performer, returned in search results
  , page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  , sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  }
  deriving (Eq, Show)

performerBaseResponseSchema :: FC.Fleece schema => schema PerformerBaseResponse
performerBaseResponseSchema =
  FC.object $
    FC.constructor PerformerBaseResponse
      #+ FC.optional "performers" performers (FC.list PerformerBase.performerBaseSchema)
      #+ FC.optional "page" page ResponsePage.responsePageSchema
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema