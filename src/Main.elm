module Main exposing (main)

import Browser
import SaintElmo.Model exposing (Model, Msg)
import SaintElmo.Subscription exposing (subscriptions)
import SaintElmo.Update exposing (update)
import SaintElmo.View exposing (view)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( SaintElmo.Model.init, Cmd.none )
