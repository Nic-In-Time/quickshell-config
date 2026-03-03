import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

import "media"
import qs.config as Config
import qs.services as Services

Rectangle {
    property bool active: Services.MediaPlayer.activeSpotifyPlayer != null
    id: root
    //width: mediaText.width
    //height: mediaText.height + cover.height + 10
    width: 500
    height: 100
    color: "transparent"

    Active {visible: active}
    Inactive {visible: !active}
}
