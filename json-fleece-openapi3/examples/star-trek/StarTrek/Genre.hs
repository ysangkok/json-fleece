{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Genre
  ( Genre(..)
  , genreSchema
  ) where

import qualified Fleece.Core as FC
import Data.Text (Text)
import Fleece.Core ((#+))
import Prelude (($), Eq, Maybe, Show)

data Genre = Genre
  { name :: Maybe Text -- ^ Genre name
  , uid :: Maybe Text -- ^ Genre unique ID
  }
  deriving (Eq, Show)

genreSchema :: FC.Fleece schema => schema Genre
genreSchema =
  FC.object $
    FC.constructor Genre
      #+ FC.optional "name" name FC.text
      #+ FC.optional "uid" uid FC.text