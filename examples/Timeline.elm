{- This app is the basic app with a timeline instance.
-}

import Html exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Random
import Vis.Timeline

main =
  App.program
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view
    }

-- MODEL


type alias Model =
    {
    }


init : (Model, Cmd Msg)
init =
    let
        model = { }
    in
        (model, Cmd.none)

-- UPDATE


type Msg
  = NoOp


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEW

view : Model -> Html Msg
view model =
  div [ class "" ]
    [ Vis.Timeline.toHtml [] []
    , button [ onClick NoOp ] [ text "Add item" ]
    ]
