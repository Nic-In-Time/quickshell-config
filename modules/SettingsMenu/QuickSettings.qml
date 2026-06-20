import Quickshell
import QtQuick

import qs.config as Config

Rectangle {
    color: "transparent"
    Text {
        id: topText
        text: "Full Settings"
        color: "white"
        font.pixelSize: Config.Theme.fontSize
    }
    Text {
        id: fullSettingsButton
        anchors.top: topText.bottom
        anchors.horizontalCenter: topText.horizontalCenter
        text: ""
        color: "white"
        font.pixelSize: 20
    }
    MouseArea {
        anchors.fill: fullSettingsButton
        onClicked: pass
    }

}