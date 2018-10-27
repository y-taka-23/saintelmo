module SaintElmo.View exposing (view)

import Html exposing (Html, div, h2, li, text, ul)
import Html.Attributes exposing (class)
import SaintElmo.Model exposing (Model, Msg)


view : Model -> Html Msg
view _ =
    div [ class "page" ]
        [ div [ class "navigation" ]
            [ div [ class "login-user" ]
                [ text "Login User" ]
            , div [ class "channel-list" ]
                [ h2 [ class "channel-list__header" ] [ text "CHANNELS" ]
                , ul []
                    [ li [ class "channel-list__name" ] [ text "lorem_ipsum" ]
                    , li [ class "channel-list__name" ] [ text "dolor" ]
                    , li [ class "channel-list__name" ] [ text "sit_amet" ]
                    , li [ class "channel-list__name" ] [ text "consectetur" ]
                    , li [ class "channel-list__name--active" ] [ text "adipiscing" ]
                    , li [ class "channel-list__name" ] [ text "elit_sed" ]
                    , li [ class "channel-list__name" ] [ text "do_eiusmod" ]
                    , li [ class "channel-list__name" ] [ text "tempor" ]
                    , li [ class "channel-list__name" ] [ text "incididunt" ]
                    , li [ class "channel-list__name" ] [ text "ut_labore" ]
                    ]
                ]
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
