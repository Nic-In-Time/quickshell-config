import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

import "../../config" as Config
import "../../services" as Services

Rectangle {
    id: root
    width: mediaText.width
    height: mediaText.height + cover.height + 10
    color: "transparent"
    
    
    
    
    RowLayout {
        //visible: activeSpotifyPlayer === null ? false : true
        id: mediaText
        Text {
            id: title
            text: Services.MediaPlayer.activeSpotifyPlayer != null ? Services.MediaPlayer.activeSpotifyPlayer.trackTitle : ""
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

            source: Services.MediaPlayer.activeSpotifyPlayer != null ? Services.MediaPlayer.activeSpotifyPlayer.trackArtUrl ?? "" : "" // qmllint disable incompatible-type
            asynchronous: true
            fillMode: Image.PreserveAspectCrop
            sourceSize.width: width
            sourceSize.height: height
        }
    }
    
    function isSpotify(player) {
        return player.dbusName === "org.mpris.MediaPlayer2.spotify" ? player : nothing()
        
    }
    function nothing() {
        
    }
}
