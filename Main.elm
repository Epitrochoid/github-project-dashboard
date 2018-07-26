module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)

import Projects exposing (Project, projects)

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }

type alias Model =
    { projects : List Project
    }


emptyModel : Model
emptyModel =
    { projects = projects }

init : (Model, Cmd Msg)
init = emptyModel ! []

type Msg
    = NoOp

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            model ! []

endl : Html msg
endl = br [] []

heading : String -> Html msg
heading title =
    h2
        []
        [ text title ]

displayProject : Project -> Html msg
displayProject project =
    div
        [ class <| "project" ++ project.name ]
        [ heading project.name,
          text project.url,
          endl,
          text project.readmeSnippet
        ]

view : Model -> Html Msg
view model =
    div
        [ class "dashboard-wrapper" ]
        (List.map displayProject model.projects)
