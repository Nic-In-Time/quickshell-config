import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Controls
import Quickshell.Wayland
import QtQuick.Layouts

import qs.config as Config


PanelWindow {
    
    //Keys.onEscapePressed: console.log("hi") //color = "white"//launcherPanel.visible = 
    
    IpcHandler {
        target: "power"
        function toggle() {
            powerConfirmPanel.visible = !powerConfirmPanel.visible
            console.log("hi")
        }
    }
    
    
    id: powerConfirmPanel
    visible: false
    focusable: false
    color: "transparent"

    

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
    onClicked: powerConfirmPanel.visible = false

        Rectangle {
            anchors.fill: parent
            color: Config.Theme.semiTransBackground //root.theme.bgOverlay
        }
    }

    // Centered launcher box
    Rectangle {
        id: powerConfirmBox
        anchors.centerIn: parent
        width: 580
        height: 240
        radius: 16
        color: Config.Theme.bgBase //root.theme.bgBase
        border.color: Config.Theme.bgBorder //root.theme.bgBorder
        border.width: 1
        ColumnLayout {
            //anchors.fill: parent
            anchors.centerIn: parent
            width: 580
            height: 240
            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                implicitHeight: parent.height / 2 - 10
                width: 540
                Rectangle {
                    height: parent.height - 10
                    width: (parent.width / 3)
                    Text {
                        anchors.centerIn: parent
                        text: "hibernate"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: hibernate.running = true
                    }
                    Process {
                        id: hibernate
                        command: ["sh", "-c", "systemctl hibernate"]
                        stdout: StdioCollector {
                            onStreamFinished: powerConfirmPanel.visible = false
                        }
                    }
                }
                Rectangle {
                    height: parent.height - 10
                    width: (parent.width / 3)
                    Text {
                        anchors.centerIn: parent
                        text: "logout"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: logout.running = true
                    }
                    Process {
                        id: logout
                        command: ["sh", "-c", "loginctl terminate-user $USER"]
                        stdout: StdioCollector {
                            onStreamFinished: powerConfirmPanel.visible = false
                        }
                    }
                }
                Rectangle {
                    height: parent.height - 10
                    width: (parent.width / 3)
                    Text {
                        anchors.centerIn: parent
                        text: "reboot"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: reboot.running = true
                    }
                    Process {
                        id: reboot
                        command: ["sh", "-c", "systemctl reboot"]
                        stdout: StdioCollector {
                            onStreamFinished: powerConfirmPanel.visible = false
                        }
                    }
                }
            }
            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.verticalCenter
                implicitHeight: parent.height / 2 - 10
                width: 540
                Rectangle {
                    height: parent.height - 10
                    width: (parent.width / 3)
                    Text {
                        anchors.centerIn: parent
                        text: "Lock"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: lock.running = true
                    }
                    Process {
                        id: lock
                        command: ["sh", "-c", "loginctl lock-session"]
                        stdout: StdioCollector {
                            onStreamFinished: powerConfirmPanel.visible = false
                        }
                    }
                    
                }
                Rectangle {
                    height: parent.height - 10
                    width: (parent.width / 3)
                    Text {
                        anchors.centerIn: parent
                        text: "Suspend"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: suspend.running = true
                    }
                    Process {
                        id: suspend
                        command: ["sh", "-c", "systemctl suspend"]
                        stdout: StdioCollector {
                            onStreamFinished: powerConfirmPanel.visible = false
                        }
                    }
                }
                Rectangle {
                    height: parent.height - 10
                    width: (parent.width / 3)
                    Text {
                        anchors.centerIn: parent
                        text: "Power off"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: powerOff.running = true
                    }
                    Process {
                        id: powerOff
                        command: ["systemctl", "poweroff"]
                        stdout: StdioCollector {
                            onStreamFinished: powerConfirmPanel.visible = false
                        }
                    }
                }
            }
        }
    }
}
