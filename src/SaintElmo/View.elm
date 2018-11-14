module SaintElmo.View exposing (view)

import Json.Decode as Json
import Html
    exposing
        ( Attribute
        , Html
        , button
        , div
        , h1
        , h2
        , img
        , input
        , li
        , p
        , text
        , ul
        )
import Html.Attributes exposing (class, placeholder, src, value)
import Html.Events exposing (keyCode, on, onClick, onInput)
import SaintElmo.Model exposing (Model, Msg(..))


view : Model -> Html Msg
view model =
    case model.loginUser of
        Nothing ->
            loginPage

        Just _ ->
            mainPage model


loginPage : Html Msg
loginPage =
    div [ class "login-page" ]
        [ div [ class "login-form" ]
            [ h1 [ class "login-form__logo" ] [ text "SaintElmo" ]
            , button [ class "login-form__google", onClick LogIn ]
                [ text "Login with Google" ]
            ]
        ]


mainPage : Model -> Html Msg
mainPage model =
    div [ class "main-page" ]
        [ div [ class "navigation" ]
            [ loginUser model
            , channelList model
            ]
        , div [ class "contents" ]
            [ channelHeader model
            , div [ class "channel-body" ]
                [ div [ class "chat" ]
                    [ history model
                    , div [ class "console" ]
                        [ button [ class "console__button" ] []
                        , input
                            [ class "console__input"
                            , placeholder "Press enter to send a message"
                            , value model.textOnConsole
                            , onInput CaptureConsole
                            , onEnterKeyUp SendMessage
                            ]
                            []
                        ]
                    ]
                , memberList model
                ]
            ]
        ]


onEnterKeyUp : Msg -> Attribute Msg
onEnterKeyUp msg =
    onKeyUp
        (\k ->
            if k == 13 then
                msg
            else
                NoOp
        )


onKeyUp : (Int -> msg) -> Attribute msg
onKeyUp tagger =
    on "keyup" <| Json.map tagger keyCode


loginUser : Model -> Html Msg
loginUser model =
    let
        avatar =
            case model.loginUser of
                Just user ->
                    user.avatar

                -- TODO: actually dead code by the branching in 'view'
                Nothing ->
                    "default_avatar.png"
    in
        div [ class "login-user" ]
            [ img [ class "login-user__avatar", src avatar ] []
            , div [ class "login-user__name", onClick LogOut ] [ text "Logout" ]
            ]


channelList : Model -> Html Msg
channelList model =
    let
        name channel =
            if channel.name == model.currentChannel.name then
                li [ class "channel-list__name--active" ] [ text channel.name ]
            else
                li [ class "channel-list__name" ] [ text channel.name ]
    in
        div [ class "channel-list" ]
            [ h2 [ class "channel-list__header" ] [ text "CHANNELS" ]
            , ul [] <| List.map name model.channels
            ]


channelHeader : Model -> Html Msg
channelHeader model =
    div [ class "channel-header" ]
        [ h1 [ class "channel-header__title" ]
            [ text model.currentChannel.name ]
        , p [ class "channel-header__description" ]
            [ text model.currentChannel.description ]
        ]


history : Model -> Html Msg
history model =
    let
        message m =
            li [ class "message" ]
                [ img [ class "message__avatar", src m.author.avatar ] []
                , div [ class "message-contents" ]
                    [ div [ class "message-contents__author" ]
                        [ text m.author.name ]
                    , p [ class "message-contents__text" ] [ text m.text ]
                    ]
                ]
    in
        ul [ class "history" ] <| List.map message model.messages


memberList : Model -> Html Msg
memberList model =
    let
        member m =
            li [ class "member" ]
                [ img [ class "member__avatar", src m.avatar ] []
                , div [ class "member__name" ] [ text m.name ]
                ]
    in
        div [ class "member-list" ]
            [ h2 [ class "member-list__header" ] [ text "MEMBERS" ]
            , ul [] <| List.map member model.members
            ]
