module SaintElmo.View exposing (view)

import Html exposing (Html, button, div, h1, h2, img, input, li, p, text, ul)
import Html.Attributes exposing (class, src)
import SaintElmo.Model exposing (Model, Msg)


view : Model -> Html Msg
view _ =
    div [ class "page" ]
        [ div [ class "navigation" ]
            [ div [ class "login-user" ]
                [ img [ class "login-user__avatar", src "default_avatar.png" ] []
                , div [ class "login-user__name" ] [ text "voluptate" ]
                ]
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
                    [ ul [ class "history" ]
                        [ li [ class "message" ]
                            [ img [ class "message__avatar", src "default_avatar.png" ] []
                            , div [ class "message-contents" ]
                                [ div [ class "message-contents__author" ] [ text "voluptate" ]
                                , p [ class "message-contents__text" ] [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit." ]
                                ]
                            ]
                        , li [ class "message" ]
                            [ img [ class "message__avatar", src "default_avatar.png" ] []
                            , div [ class "message-contents" ]
                                [ div [ class "message-contents__author" ] [ text "ut_labore" ]
                                , p [ class "message-contents__text" ] [ text "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur." ]
                                ]
                            ]
                        , li [ class "message" ]
                            [ img [ class "message__avatar", src "default_avatar.png" ] []
                            , div [ class "message-contents" ]
                                [ div [ class "message-contents__author" ] [ text "dolor" ]
                                , p [ class "message-contents__text" ] [ text "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui." ]
                                ]
                            ]
                        , li [ class "message" ]
                            [ img [ class "message__avatar", src "default_avatar.png" ] []
                            , div [ class "message-contents" ]
                                [ div [ class "message-contents__author" ] [ text "voluptate" ]
                                , p [ class "message-contents__text" ] [ text "Sed do eiusmod tempor incididunt?" ]
                                ]
                            ]
                        , li [ class "message" ]
                            [ img [ class "message__avatar", src "default_avatar.png" ] []
                            , div [ class "message-contents" ]
                                [ div [ class "message-contents__author" ] [ text "sint" ]
                                , p [ class "message-contents__text" ] [ text "Ut labore et dolore magna aliqua!" ]
                                ]
                            ]
                        ]
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
