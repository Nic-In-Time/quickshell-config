import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "../../config" as Config

RowLayout {
    implicitHeight: Config.BarConfig.height
    


    Repeater {
        model: 10

        Rectangle {

            id: rectangle
            Layout.maximumWidth: 28
            Layout.minimumWidth: 28
            Layout.preferredHeight: parent.height
            color: "transparent"

            property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
            property bool hasWindows: workspace !== null

            Text {
                id: text
                text: index + 1
                color: parent.isActive ? Config.Theme.colPurple : (parent.hasWindows ? Config.Theme.colCyan : Config.Theme.colMuted)
                font.pixelSize: Config.Theme.fontSize
                font.family: Config.Theme.fontFamily
                font.bold: true
                anchors.centerIn: parent
            }

            Rectangle {
                width: 20
                height: 3
                color: parent.isActive ? 
                Config.Theme.colPurple : Config.Theme.colBg
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
                hoverEnabled: true
                
                onEntered: rectangle.color = Qt.rgba(0.92, 0.31, 1, 0.47)
                onExited: rectangle.color = "transparent"
            }
        }
    }
}