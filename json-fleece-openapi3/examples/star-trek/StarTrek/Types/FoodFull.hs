{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.FoodFull
  ( FoodFull(..)
  , foodFullSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.FoodFull.AlcoholicBeverage as AlcoholicBeverage
import qualified StarTrek.Types.FoodFull.Beverage as Beverage
import qualified StarTrek.Types.FoodFull.Dessert as Dessert
import qualified StarTrek.Types.FoodFull.EarthlyOrigin as EarthlyOrigin
import qualified StarTrek.Types.FoodFull.Fruit as Fruit
import qualified StarTrek.Types.FoodFull.HerbOrSpice as HerbOrSpice
import qualified StarTrek.Types.FoodFull.Juice as Juice
import qualified StarTrek.Types.FoodFull.Name as Name
import qualified StarTrek.Types.FoodFull.Sauce as Sauce
import qualified StarTrek.Types.FoodFull.Soup as Soup
import qualified StarTrek.Types.FoodFull.Tea as Tea
import qualified StarTrek.Types.FoodFull.Uid as Uid

data FoodFull = FoodFull
  { beverage :: Maybe Beverage.Beverage -- ^ Whether it's a beverage
  , juice :: Maybe Juice.Juice -- ^ Whether it's a juice
  , tea :: Maybe Tea.Tea -- ^ Whether it's a tea
  , earthlyOrigin :: Maybe EarthlyOrigin.EarthlyOrigin -- ^ Whether it's of earthly origin
  , dessert :: Maybe Dessert.Dessert -- ^ Whether it's a dessert
  , sauce :: Maybe Sauce.Sauce -- ^ Whether it's a sauce
  , uid :: Uid.Uid -- ^ Food unique ID
  , fruit :: Maybe Fruit.Fruit -- ^ Whether it's a fruit
  , name :: Name.Name -- ^ Food name
  , soup :: Maybe Soup.Soup -- ^ Whether it's a soup
  , herbOrSpice :: Maybe HerbOrSpice.HerbOrSpice -- ^ Whether it's an herb or a spice
  , alcoholicBeverage :: Maybe AlcoholicBeverage.AlcoholicBeverage -- ^ Whether it's an alcoholic beverage
  }
  deriving (Eq, Show)

foodFullSchema :: FC.Fleece schema => schema FoodFull
foodFullSchema =
  FC.object $
    FC.constructor FoodFull
      #+ FC.optional "beverage" beverage Beverage.beverageSchema
      #+ FC.optional "juice" juice Juice.juiceSchema
      #+ FC.optional "tea" tea Tea.teaSchema
      #+ FC.optional "earthlyOrigin" earthlyOrigin EarthlyOrigin.earthlyOriginSchema
      #+ FC.optional "dessert" dessert Dessert.dessertSchema
      #+ FC.optional "sauce" sauce Sauce.sauceSchema
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.optional "fruit" fruit Fruit.fruitSchema
      #+ FC.required "name" name Name.nameSchema
      #+ FC.optional "soup" soup Soup.soupSchema
      #+ FC.optional "herbOrSpice" herbOrSpice HerbOrSpice.herbOrSpiceSchema
      #+ FC.optional "alcoholicBeverage" alcoholicBeverage AlcoholicBeverage.alcoholicBeverageSchema