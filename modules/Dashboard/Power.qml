import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

import qs.config as Config
import "power/"

Rectangle {
    id: root

    color: "transparent"
    width: parent.width
    anchors.horizontalCenter: parent.horizontalCenter
    PowerProfiles {
        id: powerProfiles
        width: parent.width / 2
        anchors.left: powerStatus.right
    }
    /*Text {
        id: topText
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Power Profiles"
        color: "white"
        font.pixelSize: Config.Theme.fontSize
        font.family: Config.Theme.fontFamily
    }
    Rectangle {
        id: powerProfileIcons
        anchors.top: topText.bottom
        anchors.horizontalCenter: topText.horizontalCenter
        width: parent.width / 2
        height: 80
        //height: 3
        color: "transparent"
        Rectangle {
            id: balanced

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 50
            height: 40
            color: PowerProfiles.profile == 1 ? '#708729ca' : "transparent"
            Text {
                text: ""
                color: "white"
                font.pixelSize: Config.Theme.fontSize
                font.family: Config.Theme.fontFamily
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: PowerProfiles.profile = 1
            }
        }
        Rectangle {
            anchors.left: balanced.right
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 40
            color: PowerProfiles.profile == 2 ? '#708729ca' : "transparent"
            Text {
                text: ""
                color: "white"
                font.pixelSize: Config.Theme.fontSize
                font.family: Config.Theme.fontFamily
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: PowerProfiles.profile = 2
            }
        }
        Rectangle {
            anchors.right: balanced.left
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 40
            color: PowerProfiles.profile == 0 ? '#708729ca' : "transparent"
            Text {
                text: ""
                color: "white"
                font.pixelSize: Config.Theme.fontSize
                font.family: Config.Theme.fontFamily
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parenttransparent
                onClicked: PowerProfiles.profile = 0
            }
        }
    }*/
    PowerStatus {
        id: powerStatus
        width: parent.width / 2
    }
}
