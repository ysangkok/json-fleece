{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Types.BookHeader
  ( BookHeader(..)
  , bookHeaderSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Show)
import qualified StarTrek.Types.BookHeader.Title as Title
import qualified StarTrek.Types.BookHeader.Uid as Uid

data BookHeader = BookHeader
  { uid :: Uid.Uid -- ^ Book unique ID
  , title :: Title.Title -- ^ Book title
  }
  deriving (Eq, Show)

bookHeaderSchema :: FC.Fleece schema => schema BookHeader
bookHeaderSchema =
  FC.object $
    FC.constructor BookHeader
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.required "title" title Title.titleSchema