{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.LiteratureFull
  ( LiteratureFull(..)
  , literatureFullSchema
  ) where

import qualified Fleece.Core as FC
import Data.Text (Text)
import Fleece.Core ((#+))
import Prelude (($), Bool, Eq, Maybe, Show)

data LiteratureFull = LiteratureFull
  { scientificLiterature :: Maybe Bool -- ^ Whether it's a scientific literature
  , shakespeareanWork :: Maybe Bool -- ^ Whether it's a Shakespearean work
  , uid :: Text -- ^ Literature unique ID
  , religiousLiterature :: Maybe Bool -- ^ Whether it's a religious literature
  , title :: Text -- ^ Literature title
  , technicalManual :: Maybe Bool -- ^ Whether it's a technical manual
  , earthlyOrigin :: Maybe Bool -- ^ Whether it's of earthly origin
  , report :: Maybe Bool -- ^ Whether it's a report
  }
  deriving (Eq, Show)

literatureFullSchema :: FC.Fleece schema => schema LiteratureFull
literatureFullSchema =
  FC.object $
    FC.constructor LiteratureFull
      #+ FC.optional "scientificLiterature" scientificLiterature FC.boolean
      #+ FC.optional "shakespeareanWork" shakespeareanWork FC.boolean
      #+ FC.required "uid" uid FC.text
      #+ FC.optional "religiousLiterature" religiousLiterature FC.boolean
      #+ FC.required "title" title FC.text
      #+ FC.optional "technicalManual" technicalManual FC.boolean
      #+ FC.optional "earthlyOrigin" earthlyOrigin FC.boolean
      #+ FC.optional "report" report FC.boolean