module SaintElmo.Update exposing (update)

import Json.Encode as Json
import SaintElmo.Model exposing (Message, Model, Msg(..), User)
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

        ReceiveChannel chan ->
            ( { model | channels = chan :: model.channels }, Cmd.none )

        ReceiveMessage message ->
            ( { model | messages = message :: model.messages }, Cmd.none )

        SendMessage ->
            if String.isEmpty model.textOnConsole then
                ( model, Cmd.none )
            else
                let
                    -- TODO: actually never model.loginUser == Noghing
                    dummyUser =
                        { name = "Anonymous", avatar = "default_avatar.png" }

                    message =
                        { author = Maybe.withDefault dummyUser model.loginUser
                        , text = model.textOnConsole
                        }
                in
                    ( { model | textOnConsole = "" }, sendMessage message )

        CaptureConsole text ->
            ( { model | textOnConsole = text }, Cmd.none )


logIn : Cmd msg
logIn =
    Port.logIn Json.null


logOut : Cmd msg
logOut =
    Port.logOut Json.null


sendMessage : Message -> Cmd msg
sendMessage =
    Port.sendMessage << messageEncoder


userEncoder : User -> Json.Value
userEncoder user =
    Json.object
        [ ( "name", Json.string user.name )
        , ( "avatar", Json.string user.avatar )
        ]


messageEncoder : Message -> Json.Value
messageEncoder message =
    Json.object
        [ ( "author", userEncoder message.author )
        , ( "text", Json.string message.text )
        ]
