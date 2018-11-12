module SaintElmo.Model exposing (Model, Msg(..), User, init)


type Msg
    = LogIn
    | LogOut
    | SetLoginUser User
    | UnsetLoginUser


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
    , messages =
        [ { author =
                { name = "valuptate"
                , avatar = "default_avatar.png"
                }
          , text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
          }
        , { author =
                { name = "ut_labore"
                , avatar = "default_avatar.png"
                }
          , text = "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
          }
        , { author =
                { name = "dolor"
                , avatar = "default_avatar.png"
                }
          , text = "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui."
          }
        , { author =
                { name = "voluptate"
                , avatar = "default_avatar.png"
                }
          , text = "Sed do eiusmod tempor incididunt?"
          }
        , { author =
                { name = "sint"
                , avatar = "default_avatar.png"
                }
          , text = "Ut labore et dolore magna aliqua!"
          }
        ]
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
