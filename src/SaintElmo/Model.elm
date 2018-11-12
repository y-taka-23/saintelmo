module SaintElmo.Model exposing (Message, Model, Msg(..), User, init)


type Msg
    = NoOp -- TODO: for error handling
    | LogIn
    | LogOut
    | SetLoginUser User
    | UnsetLoginUser
    | AddMessage Message


init : Model
init =
    { loginUser = Nothing
    , channels =
        [ { name = "lorem_ipsum", description = "" }
        , { name = "dolor", description = "" }
        , { name = "sit_amet", description = "" }
        , { name = "consectetur", description = "" }
        , { name = "adipiscing", description = "" }
        , { name = "elit_sed", description = "" }
        , { name = "do_eiusmod", description = "" }
        , { name = "tempor", description = "" }
        , { name = "incididunt", description = "" }
        , { name = "ut_labore", description = "" }
        ]
    , currentChannel =
        { name = "adipiscing"
        , description = "Excepteur sint occaecat cupidatat non proident."
        }
    , messages = []
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
