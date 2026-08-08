import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import qs.config as Config

RowLayout {
    implicitHeight: Config.BarConfig.height
    property var workspaceCountGreaterThan10: Hyprland.workspaces.values.filter(ws => isUnnamed(ws)).length
    property var workspaceGreaterThan10: Hyprland.workspaces.values.filter(ws => isUnnamed(ws))
    property int workspaceCount: workspaceCountGreaterThan10 + 10

    Repeater {
        model: workspaceCount //(10 /* + workspaceCountGreaterThan10*/)
        //onItemAdded: console.log(workspaceCount)

        Rectangle {
            id: rectangle
            Layout.maximumWidth: 28
            Layout.minimumWidth: 28
            Layout.preferredHeight: parent.height
            color: "transparent"

            property var workspace: index > 9 ? workspaceGreaterThan10[index - 10] : Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
            property bool isActive: index > 9 ? Hyprland.focusedWorkspace?.id == workspaceGreaterThan10[index - 10].id : Hyprland.focusedWorkspace?.id === (index + 1)
            property bool hasWindows: workspace !== null

            Text {
                id: text
                text: index > 9 ? workspaceGreaterThan10[index - 10].id : index + 1
                color: parent.isActive ? Config.Theme.colPurple : (parent.hasWindows ? Config.Theme.colCyan : Config.Theme.colMuted)
                font.pixelSize: Config.Theme.fontSize
                font.family: Config.Theme.fontFamily
                font.bold: true
                anchors.centerIn: parent
            }

            Rectangle {
                width: 20
                height: 3
                color: parent.isActive ? Config.Theme.colPurple : Config.Theme.colBg
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                onClicked: Hyprland.dispatch("hl.dispatch(hl.dsp.focus({ workspace = " + (index > 9 ? workspaceGreaterThan10[index - 10].id : index + 1) + " }))")

                hoverEnabled: true

                onEntered: rectangle.color = Config.Theme.hoverDarken
                onExited: rectangle.color = "transparent"
            }
        }
    }
    function isUnnamed(workspace) {
        if (workspace.id > 10) {
            return workspace;
        }
        return false;
    }
}
