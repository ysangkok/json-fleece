{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.FoodBase
  ( FoodBase(..)
  , foodBaseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Types.FoodBase.AlcoholicBeverage as AlcoholicBeverage
import qualified StarTrek.Types.FoodBase.Beverage as Beverage
import qualified StarTrek.Types.FoodBase.Dessert as Dessert
import qualified StarTrek.Types.FoodBase.EarthlyOrigin as EarthlyOrigin
import qualified StarTrek.Types.FoodBase.Fruit as Fruit
import qualified StarTrek.Types.FoodBase.HerbOrSpice as HerbOrSpice
import qualified StarTrek.Types.FoodBase.Juice as Juice
import qualified StarTrek.Types.FoodBase.Name as Name
import qualified StarTrek.Types.FoodBase.Sauce as Sauce
import qualified StarTrek.Types.FoodBase.Soup as Soup
import qualified StarTrek.Types.FoodBase.Tea as Tea
import qualified StarTrek.Types.FoodBase.Uid as Uid

data FoodBase = FoodBase
  { name :: Name.Name -- ^ Food name
  , tea :: Maybe Tea.Tea -- ^ Whether it's a tea
  , juice :: Maybe Juice.Juice -- ^ Whether it's a juice
  , uid :: Uid.Uid -- ^ Food unique ID
  , fruit :: Maybe Fruit.Fruit -- ^ Whether it's a fruit
  , dessert :: Maybe Dessert.Dessert -- ^ Whether it's a dessert
  , herbOrSpice :: Maybe HerbOrSpice.HerbOrSpice -- ^ Whether it's a herb or a spice
  , beverage :: Maybe Beverage.Beverage -- ^ Whether it's a beverage
  , soup :: Maybe Soup.Soup -- ^ Whether it's a soup
  , earthlyOrigin :: Maybe EarthlyOrigin.EarthlyOrigin -- ^ Whether it's of earthly origin
  , sauce :: Maybe Sauce.Sauce -- ^ Whether it's a sauce
  , alcoholicBeverage :: Maybe AlcoholicBeverage.AlcoholicBeverage -- ^ Whether it's an alcoholic beverage
  }
  deriving (Eq, Show)

foodBaseSchema :: FC.Fleece schema => schema FoodBase
foodBaseSchema =
  FC.object $
    FC.constructor FoodBase
      #+ FC.required "name" name Name.nameSchema
      #+ FC.optional "tea" tea Tea.teaSchema
      #+ FC.optional "juice" juice Juice.juiceSchema
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.optional "fruit" fruit Fruit.fruitSchema
      #+ FC.optional "dessert" dessert Dessert.dessertSchema
      #+ FC.optional "herbOrSpice" herbOrSpice HerbOrSpice.herbOrSpiceSchema
      #+ FC.optional "beverage" beverage Beverage.beverageSchema
      #+ FC.optional "soup" soup Soup.soupSchema
      #+ FC.optional "earthlyOrigin" earthlyOrigin EarthlyOrigin.earthlyOriginSchema
      #+ FC.optional "sauce" sauce Sauce.sauceSchema
      #+ FC.optional "alcoholicBeverage" alcoholicBeverage AlcoholicBeverage.alcoholicBeverageSchema