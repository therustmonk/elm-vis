module Vis.Timeline exposing (
    toHtml,
    Item, Items,
    items
    )

{-| A library to use Timeline component from vis.js.

# Chart
@docs toHtml

# Types
@docs Item, Items

# Attributes 
@docs items

-}

import Array exposing (Array)
import Date exposing (Date)
import Html exposing (Html, Attribute)
import Html.Attributes as Attributes
import Html.Events as Events
import Json.Encode as JE
import Json.Decode as JD
import Native.Timeline


-- TODO Add DataView model and update function for it.

{-| One item (point on timeline).
-}
type alias Item =
    { content : String
    , start : Date
    }


{-| List of items.
-}
type alias Items = List Item

{-| Set items to timeline.
-}
items : Items -> Attribute msg
items list =
    let
        packItem item = JE.object <|
            [ ("content", JE.string item.content)
            , ("start", Native.Timeline.packDate item.start )
            ]
        packedItems = List.map packItem list |> JE.list 
    in
        Attributes.property "__items__" packedItems

{-| Creates `Html` instance with Timeline attached to it.

    Vis.Timeline.toHtml [] []
-}
toHtml : List (Attribute msg) -> List (Html msg) -> Html msg
toHtml =
    Native.Timeline.toHtml

