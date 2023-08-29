{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.FoodBaseResponse
  ( FoodBaseResponse(..)
  , foodBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.FoodBase as FoodBase
import qualified StarTrek.Types.ResponsePage as ResponsePage
import qualified StarTrek.Types.ResponseSort as ResponseSort

data FoodBaseResponse = FoodBaseResponse
  { page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  , foods :: Maybe [FoodBase.FoodBase] -- ^ Base food, returned in search results
  , sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  }
  deriving (Eq, Show)

foodBaseResponseSchema :: FC.Fleece schema => schema FoodBaseResponse
foodBaseResponseSchema =
  FC.object $
    FC.constructor FoodBaseResponse
      #+ FC.optional "page" page ResponsePage.responsePageSchema
      #+ FC.optional "foods" foods (FC.list FoodBase.foodBaseSchema)
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema