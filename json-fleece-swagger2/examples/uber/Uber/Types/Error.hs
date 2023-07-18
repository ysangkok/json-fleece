{-# LANGUAGE NoImplicitPrelude #-}

module Uber.Types.Error
  ( Error(..)
  , errorSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified Uber.Types.Error.Code as Code
import qualified Uber.Types.Error.Fields as Fields
import qualified Uber.Types.Error.Message as Message

data Error = Error
  { message :: Maybe Message.Message
  , fields :: Maybe Fields.Fields
  , code :: Maybe Code.Code
  }
  deriving (Eq, Show)

errorSchema :: FC.Fleece schema => schema Error
errorSchema =
  FC.object $
    FC.constructor Error
      #+ FC.optional "message" message Message.messageSchema
      #+ FC.optional "fields" fields Fields.fieldsSchema
      #+ FC.optional "code" code Code.codeSchema