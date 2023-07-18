{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.TradingCardBaseResponse
  ( TradingCardBaseResponse(..)
  , tradingCardBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.ResponsePage as ResponsePage
import qualified StarTrek.Types.ResponseSort as ResponseSort
import qualified StarTrek.Types.TradingCardBase as TradingCardBase

data TradingCardBaseResponse = TradingCardBaseResponse
  { page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  , tradingCards :: Maybe [TradingCardBase.TradingCardBase] -- ^ Base trading card, returned in search results
  , sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  }
  deriving (Eq, Show)

tradingCardBaseResponseSchema :: FC.Fleece schema => schema TradingCardBaseResponse
tradingCardBaseResponseSchema =
  FC.object $
    FC.constructor TradingCardBaseResponse
      #+ FC.optional "page" page ResponsePage.responsePageSchema
      #+ FC.optional "tradingCards" tradingCards (FC.list TradingCardBase.tradingCardBaseSchema)
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema