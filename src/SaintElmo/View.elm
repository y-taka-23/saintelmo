module SaintElmo.View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import SaintElmo.Model exposing (Model, Msg)


view : Model -> Html Msg
view _ =
    div [ class "page" ]
        [ div [ class "navigation" ]
            [ div [ class "login-user" ]
                [ text "Login User" ]
            , div [ class "channel-list" ]
                [ text "Channel List" ]
            ]
        , div [ class "contents" ]
            [ div [ class "channel-header" ]
                [ text "Cannel Header" ]
            , div [ class "channel-body" ]
                [ div [ class "chat" ]
                    [ div [ class "history" ] [ text "History" ]
                    , div [ class "console" ] [ text "Console" ]
                    ]
                , div [ class "member-list" ]
                    [ text "Member List" ]
                ]
            ]
        ]
