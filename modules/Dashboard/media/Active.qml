import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

import "../"
import qs.config as Config
import qs.services as Services

Rectangle {
    anchors.fill: parent
    color: "transparent"
    RowLayout {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        //visible: activeSpotifyPlayer === null ? false : true
        id: mediaText
        Text {
            id: title
            text: Services.MediaPlayer.activeSpotifyPlayer.trackTitle
            color: "white"
            font.family: Config.Theme.fontFamily
            font.pixelSize: Config.Theme.fontSize

        }
        
        MediaButtons {}
    }
        
    Rectangle {
        //visible: activeSpotifyPlayer === null ? false : true
        id: cover
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

        implicitWidth: 60
        implicitHeight: 60

        color: Config.Theme.accentPrimary
        radius: Infinity
        
        Image {
            id: image

            anchors.fill: parent

            source: Services.MediaPlayer.activeSpotifyPlayer.trackArtUrl ?? ""
            asynchronous: true
            fillMode: Image.PreserveAspectCrop
            sourceSize.width: width
            sourceSize.height: height
        }
    }
}