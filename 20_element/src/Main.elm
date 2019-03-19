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
    { result : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { result = "" }
    , Cmd.none
    )


type Msg
    = Click
    | GetRepo (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click ->
            ( model
              -- send request
            , Http.get
                { url = "https://api.github.com/repos/elm/core"
                , expect = Http.expectString GetRepo
                }
            )

        -- success
        GetRepo (Ok repo) ->
            ( { model | result = repo }, Cmd.none )

        -- failure
        GetRepo (Err error) ->
            ( { model | result = Debug.toString error }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Click ] [ text "Get repo info" ]
        , p [] [ text model.result ]
        ]
