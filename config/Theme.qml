pragma Singleton
import QtQuick


QtObject {
    // Random colours
    readonly property string colBg:     "#1a1b26"
    readonly property string colFg:     "#a9b1d6"
    readonly property string colMuted:  "#444b6a"
    readonly property string colCyan:   "#0db9d7"
    readonly property string colPurple: "#ad8ee6"
    readonly property string colRed:    "#f7768e"
    readonly property string colYellow: "#e0af68"
    readonly property string colBlue:   "#7aa2f7"

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
    readonly property int fontSize:   14

    readonly property int notifTimeout: 5000
}
