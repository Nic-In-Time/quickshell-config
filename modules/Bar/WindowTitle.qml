import Quickshell.Hyprland
import QtQuick

import qs.config as Config

Text {
    anchors.centerIn: parent
    text: Hyprland.activeToplevel?.wayland?.activated ? Hyprland.activeToplevel.title : "Desktop"
    color: "white"
    font.pixelSize: Config.Theme.fontSize
    font.family: Config.Theme.fontFamily
    font.bold: true
}