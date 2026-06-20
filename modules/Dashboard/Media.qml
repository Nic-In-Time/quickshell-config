import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

import "media"
import qs.config as Config
import qs.services as Services

Rectangle {
    id: root
    property bool active: Services.MediaPlayer.activePlayer != null
    //width: mediaText.width
    //height: mediaText.height + cover.height + 10
    width: 500
    height: 150
    color: "transparent"

    Active {
        visible: root.active
    }
    Inactive {
        visible: !root.active
    }
}
