module View.UpdateAvailable exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (id, placeholder, src, style, target, title, type_, value)
import Html.Events exposing (keyCode, on, onCheck, onClick, onFocus, onInput, onSubmit)
import Ipc
import Setup.Msg as Msg exposing (Msg)
import StylesheetHelper exposing (CssClasses(..), class, classList, id)


view : Maybe String -> Html Msg
view availableUpdateVersion =
    case availableUpdateVersion of
        Nothing ->
            div [] []

        Just version ->
            div [ Attr.class "alert alert-success" ]
                [ span [ Attr.class "glyphicon glyphicon-flag", class [ BufferRight ] ] []
                , text "A new version is downloaded and ready to install. "
                , a [ onClick <| Msg.SendIpc Ipc.QuitAndInstall, Attr.href "#", Attr.class "alert-link", class [ HandPointer ] ] [ text "Update now" ]
                , text "."
                ]
