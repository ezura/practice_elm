module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Http


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { repo : String
    , core : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { repo = "", core = "" }
    , Cmd.none
    )


type Msg
    = Click
    | GetRepo (Result Http.Error String)
    | GetCoreModule (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click ->
            ( model
              -- send request
            , Cmd.batch
                [ Http.get
                    { url = "https://api.github.com/repos/elm/svg"
                    , expect = Http.expectString GetRepo
                    }
                , Http.get
                    { url = "https://api.github.com/repos/elm/core"
                    , expect = Http.expectString GetCoreModule
                    }
                ]
            )

        -- success
        GetRepo (Ok repo) ->
            ( { model | repo = repo }, Cmd.none )

        -- failure
        GetRepo (Err error) ->
            ( { model | repo = Debug.toString error }, Cmd.none )

        -- success
        GetCoreModule (Ok repo) ->
            ( { model | core = repo }, Cmd.none )

        -- failure
        GetCoreModule (Err error) ->
            ( { model | core = Debug.toString error }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Click ] [ text "Get repo info" ]
        , p [] [ text model.repo ]
        , p [] [ text model.core ]
        ]
