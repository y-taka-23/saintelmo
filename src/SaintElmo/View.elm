module SaintElmo.View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import SaintElmo.Model exposing (Model, Msg)


view : Model -> Html Msg
view _ =
    div [ class "page" ]
        [ div [ class "navigation" ] [ text "Navigation" ]
        , div [ class "contents" ] [ text "Contents" ]
        ]
