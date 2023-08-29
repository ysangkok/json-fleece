{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.MovieBase
  ( MovieBase(..)
  , movieBaseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.MovieBase.StardateFrom as StardateFrom
import qualified StarTrek.Types.MovieBase.StardateTo as StardateTo
import qualified StarTrek.Types.MovieBase.Title as Title
import qualified StarTrek.Types.MovieBase.TitleBulgarian as TitleBulgarian
import qualified StarTrek.Types.MovieBase.TitleCatalan as TitleCatalan
import qualified StarTrek.Types.MovieBase.TitleChineseTraditional as TitleChineseTraditional
import qualified StarTrek.Types.MovieBase.TitleGerman as TitleGerman
import qualified StarTrek.Types.MovieBase.TitleItalian as TitleItalian
import qualified StarTrek.Types.MovieBase.TitleJapanese as TitleJapanese
import qualified StarTrek.Types.MovieBase.TitlePolish as TitlePolish
import qualified StarTrek.Types.MovieBase.TitleRussian as TitleRussian
import qualified StarTrek.Types.MovieBase.TitleSerbian as TitleSerbian
import qualified StarTrek.Types.MovieBase.TitleSpanish as TitleSpanish
import qualified StarTrek.Types.MovieBase.Uid as Uid
import qualified StarTrek.Types.MovieBase.UsReleaseDate as UsReleaseDate
import qualified StarTrek.Types.MovieBase.YearFrom as YearFrom
import qualified StarTrek.Types.MovieBase.YearTo as YearTo
import qualified StarTrek.Types.StaffHeader as StaffHeader

data MovieBase = MovieBase
  { title :: Title.Title -- ^ Movie title
  , yearFrom :: Maybe YearFrom.YearFrom -- ^ Starting year of movie story
  , titleGerman :: Maybe TitleGerman.TitleGerman -- ^ Movie title in German
  , titlePolish :: Maybe TitlePolish.TitlePolish -- ^ Movie title in Polish
  , titleChineseTraditional :: Maybe TitleChineseTraditional.TitleChineseTraditional -- ^ Movie title in Chinese traditional
  , titleBulgarian :: Maybe TitleBulgarian.TitleBulgarian -- ^ Movie title in Bulgarian
  , titleItalian :: Maybe TitleItalian.TitleItalian -- ^ Movie title in Italian
  , titleSerbian :: Maybe TitleSerbian.TitleSerbian -- ^ Movie title in Serbian
  , uid :: Uid.Uid -- ^ Movie unique ID
  , titleCatalan :: Maybe TitleCatalan.TitleCatalan -- ^ Movie title in Catalan
  , stardateFrom :: Maybe StardateFrom.StardateFrom -- ^ Starting stardate of movie story
  , titleRussian :: Maybe TitleRussian.TitleRussian -- ^ Movie title in Russian
  , titleJapanese :: Maybe TitleJapanese.TitleJapanese -- ^ Movie title in Japanese
  , titleSpanish :: Maybe TitleSpanish.TitleSpanish -- ^ Movie title in Spanish
  , yearTo :: Maybe YearTo.YearTo -- ^ Ending year of movie story
  , stardateTo :: Maybe StardateTo.StardateTo -- ^ Ending stardate of movie story
  , mainDirector :: Maybe StaffHeader.StaffHeader -- ^ Header staff, embedded in other objects
  , usReleaseDate :: Maybe UsReleaseDate.UsReleaseDate -- ^ Date the movie was first released in the United States
  }
  deriving (Eq, Show)

movieBaseSchema :: FC.Fleece schema => schema MovieBase
movieBaseSchema =
  FC.object $
    FC.constructor MovieBase
      #+ FC.required "title" title Title.titleSchema
      #+ FC.optional "yearFrom" yearFrom YearFrom.yearFromSchema
      #+ FC.optional "titleGerman" titleGerman TitleGerman.titleGermanSchema
      #+ FC.optional "titlePolish" titlePolish TitlePolish.titlePolishSchema
      #+ FC.optional "titleChineseTraditional" titleChineseTraditional TitleChineseTraditional.titleChineseTraditionalSchema
      #+ FC.optional "titleBulgarian" titleBulgarian TitleBulgarian.titleBulgarianSchema
      #+ FC.optional "titleItalian" titleItalian TitleItalian.titleItalianSchema
      #+ FC.optional "titleSerbian" titleSerbian TitleSerbian.titleSerbianSchema
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.optional "titleCatalan" titleCatalan TitleCatalan.titleCatalanSchema
      #+ FC.optional "stardateFrom" stardateFrom StardateFrom.stardateFromSchema
      #+ FC.optional "titleRussian" titleRussian TitleRussian.titleRussianSchema
      #+ FC.optional "titleJapanese" titleJapanese TitleJapanese.titleJapaneseSchema
      #+ FC.optional "titleSpanish" titleSpanish TitleSpanish.titleSpanishSchema
      #+ FC.optional "yearTo" yearTo YearTo.yearToSchema
      #+ FC.optional "stardateTo" stardateTo StardateTo.stardateToSchema
      #+ FC.optional "mainDirector" mainDirector StaffHeader.staffHeaderSchema
      #+ FC.optional "usReleaseDate" usReleaseDate UsReleaseDate.usReleaseDateSchema