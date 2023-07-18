{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.SpacecraftFull
  ( SpacecraftFull(..)
  , spacecraftFullSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.OrganizationBase as OrganizationBase
import qualified StarTrek.Types.SpacecraftClassBase as SpacecraftClassBase
import qualified StarTrek.Types.SpacecraftFull.DateStatus as DateStatus
import qualified StarTrek.Types.SpacecraftFull.Name as Name
import qualified StarTrek.Types.SpacecraftFull.Registry as Registry
import qualified StarTrek.Types.SpacecraftFull.Status as Status
import qualified StarTrek.Types.SpacecraftFull.Uid as Uid
import qualified StarTrek.Types.SpacecraftType as SpacecraftType

data SpacecraftFull = SpacecraftFull
  { spacecraftClass :: Maybe SpacecraftClassBase.SpacecraftClassBase -- ^ Base spacecraft class, returned in search results
  , uid :: Uid.Uid -- ^ Spacecraft unique ID
  , registry :: Maybe Registry.Registry -- ^ Spacecraft registry
  , owner :: Maybe OrganizationBase.OrganizationBase -- ^ Base organization, returned in search results
  , dateStatus :: Maybe DateStatus.DateStatus -- ^ Date the spacecraft status was last known
  , spacecraftTypes :: Maybe [SpacecraftType.SpacecraftType] -- ^ Rating of video release, etc.
  , name :: Name.Name -- ^ Spacecraft name
  , status :: Maybe Status.Status -- ^ Status of a spacecraft (in prime reality, if spacecraft was in more than one realities)
  , operator :: Maybe OrganizationBase.OrganizationBase -- ^ Base organization, returned in search results
  }
  deriving (Eq, Show)

spacecraftFullSchema :: FC.Fleece schema => schema SpacecraftFull
spacecraftFullSchema =
  FC.object $
    FC.constructor SpacecraftFull
      #+ FC.optional "spacecraftClass" spacecraftClass SpacecraftClassBase.spacecraftClassBaseSchema
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.optional "registry" registry Registry.registrySchema
      #+ FC.optional "owner" owner OrganizationBase.organizationBaseSchema
      #+ FC.optional "dateStatus" dateStatus DateStatus.dateStatusSchema
      #+ FC.optional "spacecraftTypes" spacecraftTypes (FC.list SpacecraftType.spacecraftTypeSchema)
      #+ FC.required "name" name Name.nameSchema
      #+ FC.optional "status" status Status.statusSchema
      #+ FC.optional "operator" operator OrganizationBase.organizationBaseSchema