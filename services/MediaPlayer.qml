pragma Singleton

import Quickshell.Services.Mpris
import Quickshell

Singleton {
    property list<MprisPlayer> players: Mpris.players.values
    property var activeSpotifyPlayer: players.filter(player => isSpotify(player))[0] ?? null

    function isSpotify(player) {
        return player.dbusName === "org.mpris.MediaPlayer2.spotify" ? player : nothing()
        
    }
    function nothing() {
        
    }
}