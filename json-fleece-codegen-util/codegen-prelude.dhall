let
  DateTimeFormat = < UTCTime | ZonedTime | LocalTime >

let
  DerivableClass = < Show | Eq | Ord | Enum | Bounded >

let
  DeriveClasses = < Default | These : List DerivableClass >

let
  TypeOptions =
    { Type =
        { dateTimeFormat : DateTimeFormat
        , formatSpecifier : Optional Text
        , deriveClasses : DeriveClasses
        }
    , default =
        { dateTimeFormat = DateTimeFormat.UTCTime
        , formatSpecifier = None Text
        , deriveClasses = DeriveClasses.Default
        }
    }

let
  SpecificTypeOptions =
    { type : Text
    , options : TypeOptions.Type
    }

let
  baseConfig =
    { defaultTypeOptions = TypeOptions.default
    , typeOptions = [] : List SpecificTypeOptions
    , strictAdditionalProperties = True
    }

in
  { DateTimeFormat = DateTimeFormat
  , DerivableClass = DerivableClass
  , DeriveClasses = DeriveClasses
  , TypeOptions = TypeOptions
  , SpecificTypeOptions = SpecificTypeOptions
  , baseConfig = baseConfig
  , deriveDefault = DeriveClasses.Default
  , derive = DeriveClasses.These
  , noClasses = ([] : List DerivableClass)
  , utcTime = DateTimeFormat.UTCTime
  , zonedTime = DateTimeFormat.ZonedTime
  , localTime = DateTimeFormat.LocalTime
  , show = DerivableClass.Show
  , eq = DerivableClass.Eq
  , ord = DerivableClass.Ord
  , enum = DerivableClass.Enum
  , bounded = DerivableClass.Bounded
  }
