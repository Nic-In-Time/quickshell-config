import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.config as Config

Scope {
    id: root
    property var theme: Config.Theme //DefaultTheme {}
    property var activeWindow
    // Whether to move window or just view
    property var type 

    IpcHandler {
        target: "switcher"

        function toggleMove(): void {
            toggle()
            /*workspaceSwitcherPanel.visible = !workspaceSwitcherPanel.visible
            if (workspaceSwitcherPanel.visible) {
                searchInput.text = ""
                searchInput.forceActiveFocus()*/

            root.type = "move"
            console.log(type)
            console.log("active " + Hyprland.activeToplevel.wayland.activated)
            if (Hyprland.activeToplevel.wayland.activated !== false) {
                activeWindow = Hyprland.activeToplevel.workspace
                console.log(activeWindow)
                console.log(Hyprland.activeToplevel.wayland.activated)
                //Hyprland.activeToplevel.title
            } else {
                console.log("no window")
                workspaceSwitcherPanel.visible = false
            }
                
                
            /*}*/
        }
        function toggleWorkspace(): void {
            toggle()
            root.type = "look"
            console.log(type)
            /*workspaceSwitcherPanel.visible = !workspaceSwitcherPanel.visible
            if (workspaceSwitcherPanel.visible) {
                searchInput.text = ""
                searchInput.forceActiveFocus()
                console.log("active " + Hyprland.activeToplevel.wayland.activated)
                if (Hyprland.activeToplevel.wayland.activated !== false) {
                    activeWindow = Hyprland.activeToplevel.workspace
                    console.log(activeWindow)
                    console.log(Hyprland.activeToplevel.wayland.activated)
                    //Hyprland.activeToplevel.title
                } else {
                    console.log("no window")
                    workspaceSwitcherPanel.visible = false
                }
                
                
            }*/
        }
    }

    PanelWindow {
        id: workspaceSwitcherPanel
        visible: false
        focusable: true
        color: "transparent"

        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
        WlrLayershell.namespace: "quickshell-launcher"

        exclusionMode: ExclusionMode.Ignore

        anchors {
        top: true
        bottom: true
        left: true
        right: true
        }

        // Dark overlay backdrop
        MouseArea {
        anchors.fill: parent
        onClicked: workspaceSwitcherPanel.visible = false

            Rectangle {
                anchors.fill: parent
                color: Config.Theme.semiTransBackground //root.theme.bgOverlay
            }
        }
        Rectangle {
            id: launcherBox
            anchors.centerIn: parent
            width: 580
            height: 480
            radius: 16
            color: theme.bgBase //root.theme.bgBase
            border.color: theme.bgBorder //root.theme.bgBorder
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                // Header
                Text {
                text: type == "move" ? "Move window to" : "Change active workspace to"
                color: Config.Theme.launcherPrimaryText //root.theme.accentPrimary
                font.pixelSize: 14
                font.family: "Hack Nerd Font"
                font.bold: true
                }

                // Search bar
                Rectangle {
                    Layout.fillWidth: true
                    height: 44
                    radius: 10
                    color: theme.bgSurface //root.theme.bgSurface
                    border.color: searchInput.activeFocus ? root.theme.accentPrimary : root.theme.bgBorder
                    border.width: 1


                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 14
                        anchors.rightMargin: 14
                        spacing: 10

                        Text {
                            text: ""
                            color: theme.launcherPrimaryText //root.theme.textMuted
                            font.pixelSize: 16
                            font.family: "Hack Nerd Font"
                            Layout.alignment: Qt.AlignVCenter
                        }

                        TextInput {
                            id: searchInput
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignVCenter
                            color: theme.launcherPrimaryText //root.theme.textPrimary
                            font.pixelSize: 15
                            font.family: "Hack Nerd Font"
                            clip: true
                            focus: true
                            Accessible.role: Accessible.EditableText
                            Accessible.name: "Search applications"
                            validator: IntValidator {
                                bottom: 0
                                top: 99
                            }

                            Text {
                                anchors.fill: parent
                                text: "Type to search..."
                                color: theme.launcherPrimaryText //root.theme.textMuted
                                font: parent.font
                                visible: !parent.text && !parent.activeFocus
                                verticalAlignment: Text.AlignVCenter
                            }


                            Keys.onEscapePressed: workspaceSwitcherPanel.visible = false

                            Keys.onPressed: event => {

                                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                    if (IntValidator)
                                    event.accepted = true;
                                    const entry = searchInput.text
                                    if (entry) root.switchWorkspace(entry)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    function switchWorkspace(entry, type) {
        console.log(entry)
        console.log(type)
        if (root.type == "move") {
            Hyprland.dispatch("movetoworkspace " + entry)
        } else {
            Hyprland.dispatch("workspace " + entry)
        }
        
        workspaceSwitcherPanel.visible = false

    }
    function toggle(): void {
        workspaceSwitcherPanel.visible = !workspaceSwitcherPanel.visible
        if (workspaceSwitcherPanel.visible) {
            searchInput.text = ""
            searchInput.forceActiveFocus()
            /*console.log("active " + Hyprland.activeToplevel.wayland.activated)
            if (Hyprland.activeToplevel.wayland.activated !== false) {
                activeWindow = Hyprland.activeToplevel.workspace
                console.log(activeWindow)
                console.log(Hyprland.activeToplevel.wayland.activated)
                //Hyprland.activeToplevel.title
            } else {
                console.log("no window")
                workspaceSwitcherPanel.visible = false
            }*/
            
            
        }
    }
}