module Main exposing (..)

type Msg
    = Click

update : Msg -> Model -> Model
update: msg model ->
  case msg of
      Clisk ->
          Debug.todo "send HTTP request"
