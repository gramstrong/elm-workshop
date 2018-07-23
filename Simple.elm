module Main exposing (..)

import Html exposing (Html, text, div, ol, li, a, h3, input, button)
import Html.Attributes exposing (id, href, value)
import Html.Events exposing (onInput, onClick)
import List exposing (..)


fact : Int -> Int
fact x =
    if (x == 1) then
        x
    else
        x * fact (x - 1)


factTo : Int -> List Int
factTo n =
    map fact (range 1 n)


refact : Int -> Int
refact x =
    foldl (*) 1 (range 1 x)


type Msg
    = KeyStroke String
    | ClickToAddPressed


type alias Model =
    { value : String
    , list : List String
    }


viewFun : Model -> Html Msg
viewFun md =
    let
        liList =
            map (\s -> li [] [ text s ]) md.list
    in
        div [ id "outer" ]
            [ h3 [] [ text ("Simple") ]
            , text "Enter a String"
            , input [ onInput KeyStroke, value md.value ] []
            , button [ onClick ClickToAddPressed ] [ text ("Click to Add") ]
            , ol [ id "messages" ]
                ([ li [] [ text ("Factorial: " ++ (toString << fact <| 5)) ]
                 , li [] [ text ("Factorial to: " ++ (toString << factTo <| 5)) ]
                 , li [] [ text ("Factorial Refactor: " ++ (toString << refact <| 5)) ]
                 , li [] [ a [ href "http://elm-lang.org" ] [ text "Elm Programming Lang" ] ]
                 ]
                    ++ liList
                )
            ]


updateFun : Msg -> Model -> Model
updateFun ms md =
    case ms of
        KeyStroke s ->
            { md | value = s }

        ClickToAddPressed ->
            { md | list = md.list ++ [ md.value ], value = "" }


modelFun : Model
modelFun =
    { value = "", list = [] }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = modelFun
        , view = viewFun
        , update = updateFun
        }
