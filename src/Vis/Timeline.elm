module Vis.Timeline exposing (
    toHtml
    )

{-| A library to use Timeline component from vis.js.

# Chart
@docs toHtml

-}

import Array exposing (Array)
import Html exposing (Html, Attribute)
import Html.Attributes as Attributes
import Html.Events as Events
import Json.Encode as JE
import Json.Decode as JD
import Native.Timeline

{-| Creates `Html` instance with Timeline attached to it.

    Vis.Timeline.toHtml [] []
-}
toHtml : List (Attribute msg) -> List (Html msg) -> Html msg
toHtml =
    Native.Timeline.toHtml

-- Some internal stuffs

-- packArray = Array.fromList >> JE.array
