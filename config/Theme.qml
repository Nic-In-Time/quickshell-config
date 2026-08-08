pragma Singleton
import QtQuick

QtObject {
    // NOTE: qml uses AARRGGBB instead of RRGGBBAA, so any colors that are using AA are wrong with nvim highlight colors
    // Random colours
    readonly property string colBg: "#1C0537"
    readonly property string colFg: "#a9b1d6"
    readonly property string colMuted: "#7349A0"
    readonly property string colCyan: "#0db9d7"
    readonly property string colPurple: "#ad8ee6"
    readonly property string colRed: "#f7768e"
    readonly property string colYellow: "#e0af68"
    readonly property string colBlue: "#7aa2f7"
    readonly property string colWhite: "#FFFFFF"

    property string hoverDarken: "#B0000000"
    property string barelyDarken: "#79000000"

    property string error: "#93000A"

    // Dashboard tabs
    readonly property string inactiveTab: '#7027f8'
    readonly property string activeTab: '#276df8'

    // App launcher
    readonly property string semiTransBackground: '#79000000'
    readonly property string bgBase: '#152b2c'
    readonly property string bgHover: "#24283b"
    readonly property string bgBorder: '#2c3149'
    readonly property string bgSurface: "#24283b"
    readonly property color bgSelected: "#283457"
    readonly property color accentPrimary: "#7aa2f7"
    readonly property string launcherPrimaryText: '#d8d8d8'

    // Font propertoes (Add text colour)
    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int fontSize: 14

    readonly property int notifTimeout: 5000

    property string idk: "#21152E"
    property string idk2: "#311F44"
    property string idk3: "#412A5B"
    property string idk4: "#623E89"
    property string idk5: "#7349A0"
    property string idk6: "#1C0537"

    property string idk7: "#690005"
    property string idk8: "#FFB4AB"
    property string idk9: "#93000A"
}
