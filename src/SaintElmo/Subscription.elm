module SaintElmo.Subscription exposing (subscriptions)

import Json.Decode as Json
import SaintElmo.Model exposing (Channel, Message, Model, Msg(..), User)
import SaintElmo.Port as Port


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch [ setLoginUser, unsetLoginUser, receiveMessage, receiveChannel ]


setLoginUser : Sub Msg
setLoginUser =
    let
        handler v =
            case Json.decodeValue userDecoder v of
                Ok user ->
                    SetLoginUser user

                Err _ ->
                    -- TODO: show the error as a toast
                    NoOp
    in
        Port.setLoginUser handler


userDecoder : Json.Decoder User
userDecoder =
    Json.map2 User
        (Json.field "name" Json.string)
        (Json.field "avatar" Json.string)


unsetLoginUser : Sub Msg
unsetLoginUser =
    Port.unsetLoginUser <| \_ -> UnsetLoginUser


receiveChannel : Sub Msg
receiveChannel =
    let
        handler v =
            case Json.decodeValue channelDecoder v of
                Ok chan ->
                    ReceiveChannel chan

                Err _ ->
                    -- TODO: handle the error
                    NoOp
    in
        Port.receiveChannel handler


channelDecoder : Json.Decoder Channel
channelDecoder =
    Json.map2 Channel
        (Json.field "name" Json.string)
        (Json.field "description" Json.string)


receiveMessage : Sub Msg
receiveMessage =
    let
        handler v =
            case Json.decodeValue messageDecoder v of
                Ok message ->
                    ReceiveMessage message

                Err _ ->
                    -- TODO: handle the error
                    NoOp
    in
        Port.receiveMessage handler


messageDecoder : Json.Decoder Message
messageDecoder =
    Json.map2 Message
        (Json.field "author" userDecoder)
        (Json.field "text" Json.string)
