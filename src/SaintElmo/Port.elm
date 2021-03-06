port module SaintElmo.Port
    exposing
        ( logIn
        , logOut
        , receiveMessage
        , receiveChannel
        , sendMessage
        , setLoginUser
        , unsetLoginUser
        )

import Json.Decode as D
import Json.Encode as E


port logIn : E.Value -> Cmd msg


port logOut : E.Value -> Cmd msg


port setLoginUser : (D.Value -> msg) -> Sub msg


port unsetLoginUser : (D.Value -> msg) -> Sub msg


port receiveChannel : (D.Value -> msg) -> Sub msg


port receiveMessage : (D.Value -> msg) -> Sub msg


port sendMessage : E.Value -> Cmd msg
