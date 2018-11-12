module SaintElmo.Subscription exposing (subscriptions)

import Json.Decode as Json
import SaintElmo.Model exposing (Model, Msg(..), User)
import SaintElmo.Port as Port


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch [ setLoginUser, unsetLoginUser ]


setLoginUser : Sub Msg
setLoginUser =
    let
        handler v =
            case Json.decodeValue userDecoder v of
                Ok user ->
                    SetLoginUser user

                Err _ ->
                    -- TODO: show the error as a toast
                    UnsetLoginUser
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
