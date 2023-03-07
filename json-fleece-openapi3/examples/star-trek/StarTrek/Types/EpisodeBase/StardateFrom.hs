{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.EpisodeBase.StardateFrom
  ( StardateFrom(..)
  , stardateFromSchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Eq, Float, Show)

newtype StardateFrom = StardateFrom Float
  deriving (Show, Eq)

stardateFromSchema :: FC.Fleece schema => schema StardateFrom
stardateFromSchema =
  FC.coerceSchema FC.float