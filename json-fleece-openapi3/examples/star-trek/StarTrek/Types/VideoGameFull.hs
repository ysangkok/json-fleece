{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.VideoGameFull
  ( VideoGameFull(..)
  , videoGameFullSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.CompanyBase as CompanyBase
import qualified StarTrek.Types.ContentRating as ContentRating
import qualified StarTrek.Types.Genre as Genre
import qualified StarTrek.Types.Platform as Platform
import qualified StarTrek.Types.Reference as Reference
import qualified StarTrek.Types.VideoGameFull.ReleaseDate as ReleaseDate
import qualified StarTrek.Types.VideoGameFull.StardateFrom as StardateFrom
import qualified StarTrek.Types.VideoGameFull.StardateTo as StardateTo
import qualified StarTrek.Types.VideoGameFull.SystemRequirements as SystemRequirements
import qualified StarTrek.Types.VideoGameFull.Title as Title
import qualified StarTrek.Types.VideoGameFull.Uid as Uid
import qualified StarTrek.Types.VideoGameFull.YearFrom as YearFrom
import qualified StarTrek.Types.VideoGameFull.YearTo as YearTo

data VideoGameFull = VideoGameFull
  { title :: Title.Title -- ^ Video game title
  , yearFrom :: Maybe YearFrom.YearFrom -- ^ Starting year of video game story
  , systemRequirements :: Maybe SystemRequirements.SystemRequirements -- ^ System requirements
  , uid :: Uid.Uid -- ^ Video game unique ID
  , references :: Maybe [Reference.Reference] -- ^ Reference of book, comics, video release, etc.
  , platforms :: Maybe [Platform.Platform] -- ^ Platform of video games
  , publishers :: Maybe [CompanyBase.CompanyBase] -- ^ Base company, returned in search results
  , ratings :: Maybe [ContentRating.ContentRating] -- ^ Rating of video release, etc.
  , stardateFrom :: Maybe StardateFrom.StardateFrom -- ^ Starting stardate of video game story
  , releaseDate :: Maybe ReleaseDate.ReleaseDate -- ^ Release date
  , developers :: Maybe [CompanyBase.CompanyBase] -- ^ Base company, returned in search results
  , yearTo :: Maybe YearTo.YearTo -- ^ Ending year of video game story
  , stardateTo :: Maybe StardateTo.StardateTo -- ^ Ending stardate of video game story
  , genres :: Maybe [Genre.Genre] -- ^ Genre of video games
  }
  deriving (Eq, Show)

videoGameFullSchema :: FC.Fleece schema => schema VideoGameFull
videoGameFullSchema =
  FC.object $
    FC.constructor VideoGameFull
      #+ FC.required "title" title Title.titleSchema
      #+ FC.optional "yearFrom" yearFrom YearFrom.yearFromSchema
      #+ FC.optional "systemRequirements" systemRequirements SystemRequirements.systemRequirementsSchema
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.optional "references" references (FC.list Reference.referenceSchema)
      #+ FC.optional "platforms" platforms (FC.list Platform.platformSchema)
      #+ FC.optional "publishers" publishers (FC.list CompanyBase.companyBaseSchema)
      #+ FC.optional "ratings" ratings (FC.list ContentRating.contentRatingSchema)
      #+ FC.optional "stardateFrom" stardateFrom StardateFrom.stardateFromSchema
      #+ FC.optional "releaseDate" releaseDate ReleaseDate.releaseDateSchema
      #+ FC.optional "developers" developers (FC.list CompanyBase.companyBaseSchema)
      #+ FC.optional "yearTo" yearTo YearTo.yearToSchema
      #+ FC.optional "stardateTo" stardateTo StardateTo.stardateToSchema
      #+ FC.optional "genres" genres (FC.list Genre.genreSchema)