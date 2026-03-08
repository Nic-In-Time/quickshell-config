import QtQuick
import Quickshell

import qs.config as Config

Rectangle {
    
    color: "transparent"
    height: 80
    Rectangle {
        height: 40; width: 40
        color: "transparent"
        Text {
            anchors.centerIn: parent
            text: "⏻"
            color: "white"
            font.family: Config.Theme.fontFamily
            font.pixelSize: Config.Theme.fontSize
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = Config.Theme.semiTransBackground
            onExited: parent.color = "transparent"
            onClicked: powerConfirm.visible = !powerConfirm.visible
        }
    }

    PowerConfirm {id: powerConfirm}
    
}