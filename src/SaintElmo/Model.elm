module SaintElmo.Model exposing (Channel, Message, Model, Msg(..), User, init)


type Msg
    = NoOp -- TODO: for error handling
    | LogIn
    | LogOut
    | SetLoginUser User
    | UnsetLoginUser
    | ReceiveChannel Channel
    | ReceiveMessage Message
    | SendMessage
    | CaptureConsole String


init : Model
init =
    { loginUser = Nothing
    , channels = []
    , currentChannel =
        { name = "adipiscing"
        , description = "Excepteur sint occaecat cupidatat non proident."
        }
    , messages = []
    , textOnConsole = ""
    , members =
        [ { name = "sit_amet", avatar = "default_avatar.png" }
        , { name = "consectetur", avatar = "default_avatar.png" }
        , { name = "elit_sed", avatar = "default_avatar.png" }
        , { name = "do_eiusmod", avatar = "default_avatar.png" }
        , { name = "tempor", avatar = "default_avatar.png" }
        , { name = "incididunt", avatar = "default_avatar.png" }
        ]
    }


type alias Model =
    { loginUser : Maybe User
    , channels : List Channel
    , currentChannel : Channel
    , messages : List Message
    , textOnConsole : String
    , members : List User
    }


type alias User =
    { name : String
    , avatar : Url
    }


type alias Url =
    String


type alias Channel =
    { name : String
    , description : String
    }


type alias Message =
    { author : User
    , text : String
    }
