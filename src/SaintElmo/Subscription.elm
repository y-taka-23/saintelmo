module SaintElmo.Subscription exposing (subscriptions)

import SaintElmo.Model exposing (Model, Msg)


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
