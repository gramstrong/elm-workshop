module Main exposing (..)

import Html exposing (Html, text, div, ol, li, a)
import Html.Attributes exposing (id, href)
import List exposing (..)


--Integer Definition


myNumber : Int
myNumber =
    42



--Returning Tuple


myFoo : Int -> String -> ( String, Int )
myFoo x y =
    ( y, x )



--Recursive Factorial


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



--Main


main : Html msg
main =
    div [ id "outer" ]
        [ ol [ id "messages" ]
            [ li [] [ text ("Factorial: " ++ (toString << fact <| 5)) ]
            , li [] [ text ("Factorial to: " ++ (toString << factTo <| 5)) ]
            , li [] [ text ("Factorial Refactor: " ++ (toString << refact <| 5)) ]
            , li [] [ a [ href "http://elm-lang.org" ] [ text "Elm Programming Lang" ] ]
            ]
        ]
