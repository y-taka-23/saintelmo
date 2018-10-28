module SaintElmo.View exposing (view)

import Html exposing (Html, button, div, h1, h2, input, li, p, text, ul)
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
                [ h1 [ class "channel-header__title" ] [ text "adipiscing" ]
                , p [ class "channel-header__description" ]
                    [ text "Excepteur sint occaecat cupidatat non proident." ]
                ]
            , div [ class "channel-body" ]
                [ div [ class "chat" ]
                    [ div [ class "history" ] [ text "History" ]
                    , div [ class "console" ]
                        [ button [ class "console__button" ] []
                        , input [ class "console__input" ] []
                        ]
                    ]
                , div [ class "member-list" ]
                    [ text "Member List" ]
                ]
            ]
        ]
