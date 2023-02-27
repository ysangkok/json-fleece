{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.TitleBaseResponse
  ( TitleBaseResponse(..)
  , titleBaseResponseSchema
  ) where

import qualified Fleece.Core as FC
import Fleece.Core ((#+))
import Prelude (($), Eq, Maybe, Show)
import StarTrek.ResponsePage (ResponsePage, responsePageSchema)
import StarTrek.ResponseSort (ResponseSort, responseSortSchema)
import StarTrek.TitleBase (TitleBase, titleBaseSchema)

data TitleBaseResponse = TitleBaseResponse
  { sort :: Maybe ResponseSort -- ^ Response sort
  , page :: Maybe ResponsePage -- ^ Object describing response page
  , titles :: Maybe [TitleBase] -- ^ List of titles matching given criteria
  }
  deriving (Eq, Show)

titleBaseResponseSchema :: FC.Fleece schema => schema TitleBaseResponse
titleBaseResponseSchema =
  FC.object $
    FC.constructor TitleBaseResponse
      #+ FC.optional "sort" sort responseSortSchema
      #+ FC.optional "page" page responsePageSchema
      #+ FC.optional "titles" titles (FC.list titleBaseSchema)