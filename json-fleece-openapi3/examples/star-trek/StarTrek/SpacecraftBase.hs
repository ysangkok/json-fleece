{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SpacecraftBase
  ( SpacecraftBase(..)
  , spacecraftBaseSchema
  ) where

import qualified Fleece.Core as FC
import Data.Text (Text)
import Fleece.Core ((#+))
import Prelude (($), Eq, Maybe, Show)
import StarTrek.OrganizationHeader (OrganizationHeader, organizationHeaderSchema)
import StarTrek.SpacecraftClassHeader (SpacecraftClassHeader, spacecraftClassHeaderSchema)

data SpacecraftBase = SpacecraftBase
  { name :: Text -- ^ Spacecraft name
  , registry :: Maybe Text -- ^ Spacecraft registry
  , uid :: Text -- ^ Spacecraft unique ID
  , status :: Maybe Text -- ^ Status of a spacecraft (in prime reality, if spacecraft was in more than one realities)
  , owner :: Maybe OrganizationHeader -- ^ Header organization, embedded in other objects
  , operator :: Maybe OrganizationHeader -- ^ Header organization, embedded in other objects
  , spacecraftClass :: Maybe SpacecraftClassHeader -- ^ Header spacecraft class, embedded in other objects
  , dateStatus :: Maybe Text -- ^ Date the spacecraft status was last known
  }
  deriving (Eq, Show)

spacecraftBaseSchema :: FC.Fleece schema => schema SpacecraftBase
spacecraftBaseSchema =
  FC.object $
    FC.constructor SpacecraftBase
      #+ FC.required "name" name FC.text
      #+ FC.optional "registry" registry FC.text
      #+ FC.required "uid" uid FC.text
      #+ FC.optional "status" status FC.text
      #+ FC.optional "owner" owner organizationHeaderSchema
      #+ FC.optional "operator" operator organizationHeaderSchema
      #+ FC.optional "spacecraftClass" spacecraftClass spacecraftClassHeaderSchema
      #+ FC.optional "dateStatus" dateStatus FC.text