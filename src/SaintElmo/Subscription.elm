module SaintElmo.Subscription exposing (subscriptions)

import Json.Decode as Json
import SaintElmo.Model exposing (Message, Model, Msg(..), User)
import SaintElmo.Port as Port


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch [ setLoginUser, unsetLoginUser, addMessage ]


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


addMessage : Sub Msg
addMessage =
    let
        handler v =
            case Json.decodeValue messageDecoder v of
                Ok message ->
                    AddMessage message

                Err _ ->
                    -- TODO: handle the error
                    NoOp
    in
    Port.addMessage handler


messageDecoder : Json.Decoder Message
messageDecoder =
    Json.map2 Message
        (Json.field "author" userDecoder)
        (Json.field "text" Json.string)
