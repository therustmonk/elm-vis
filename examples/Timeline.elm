{- This app is the basic app with a timeline instance.
-}

import Date exposing (Date)
import Task
import Html exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Random
import Date.Extra exposing(..)
import Vis.Timeline as Timeline

main =
  App.program
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view
    }

-- MODEL


type alias Model =
    { items : Timeline.Items
    , counter : Int
    }


init : (Model, Cmd Msg)
init =
    let
        model = { items = [ ], counter = 0 }
        task = Task.perform TaskFailed ItsNow Date.now
    in
        (model, task)

-- UPDATE


type Msg
  = ItsNow Date
  | AddItem
  | TaskFailed String


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ItsNow date ->
            let
                items' = [ { content = "Today", start = date } ]
            in
                ({ model | items = items' }, Cmd.none)
        AddItem ->
            case List.head model.items of
                Just { content, start } ->
                    let
                        counter' = model.counter + 1
                        item =
                            { content = "+" ++ (toString counter') ++ " hour(s)"
                            , start = add Hour 1 start
                            }
                    in
                        ({ model | counter = counter', items = item :: model.items }, Cmd.none)
                Nothing ->
                    (model, Cmd.none)
        TaskFailed _ ->
            (model, Cmd.none)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEW

view : Model -> Html Msg
view model =
  div [ class "" ]
    [ button [ onClick AddItem ] [ text "Add item" ]
    , Timeline.toHtml
        [ Timeline.items model.items
        ] [ ]
    ]
