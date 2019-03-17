import Html exposing (Html, a, text, h1, ul, li, div)
import Html.Attributes exposing (href)

main : Html msg
main =
    div [] [ header, content ]

header: Html msg
header =
    h1 [] [ text "Useful Links" ]

content: Html msg
content =
    ul []
    [ linkItem "https://elm-lang.org" "Homepage",
      linkItem "https://elm-lang.org" "Homepage2",
      text "incorrect tag"] {- success... -}

linkItem: String -> String -> Html msg
linkItem url text_ =
    li [] [ a [ href url ] [ text text_ ] ]
