module SaintElmo.Update exposing (update)

import Json.Encode as Json
import SaintElmo.Model exposing (Model, Msg(..))
import SaintElmo.Port as Port


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LogIn ->
            ( model, logIn )

        LogOut ->
            ( model, logOut )

        SetLoginUser user ->
            ( { model | loginUser = Just user }, Cmd.none )

        UnsetLoginUser ->
            ( { model | loginUser = Nothing }, Cmd.none )

        AddMessage message ->
            ( { model | messages = message :: model.messages }, Cmd.none )


logIn : Cmd msg
logIn =
    Port.logIn Json.null


logOut : Cmd msg
logOut =
    Port.logOut Json.null
