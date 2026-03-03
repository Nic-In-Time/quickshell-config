import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

import "../../config" as Config

Rectangle {
    width: mediaText.width
    height: mediaText.height + cover.height + 10
    color: "transparent"
    
    property list<MprisPlayer> players: Mpris.players.values
    property var activeSpotifyPlayer: players.filter(player => isSpotify(player))[0] ?? null
    visible: activeSpotifyPlayer != null
    
    RowLayout {
        id: mediaText
        Text {
            id: title
            text: activeSpotifyPlayer.trackTitle || "Unknown Title"
            color: "white"
            font.family: Config.Theme.fontFamily
            font.pixelSize: Config.Theme.fontSize
        }
        
        Text {
            id: back
            text: "󰒮"
            color: "white"
            font.family: Config.Theme.fontFamily
            font.pixelSize: Config.Theme.fontSize
            MouseArea {
                anchors.fill: parent
                onClicked: activeSpotifyPlayer.previous()
            }
        }
        Text {
            id: pausePlay
            text: activeSpotifyPlayer.playbackState == true ? "󰏤" : "󰐊"
            color: "white"
            font.family: Config.Theme.fontFamily
            font.pixelSize: Config.Theme.fontSize
            MouseArea {
                anchors.fill: parent
                onClicked: activeSpotifyPlayer.isPlaying === true ? activeSpotifyPlayer.pause() : activeSpotifyPlayer.play()
            }
        }
        Text {
            id: next
            text: "󰒭"
            color: "white"
            font.family: Config.Theme.fontFamily
            font.pixelSize: Config.Theme.fontSize
            MouseArea {
                anchors.fill: parent
                onClicked: activeSpotifyPlayer.next()
            }
        }
    }
        
    Rectangle {
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

            source: activeSpotifyPlayer.trackArtUrl ?? "" // qmllint disable incompatible-type
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
