{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.EpisodeBase.EpisodeNumber
  ( EpisodeNumber(..)
  , episodeNumberSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype EpisodeNumber = EpisodeNumber Integer
  deriving (Show, Eq)

episodeNumberSchema :: FC.Fleece schema => schema EpisodeNumber
episodeNumberSchema =
  FC.coerceSchema FC.integer