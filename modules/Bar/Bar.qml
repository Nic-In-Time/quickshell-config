import Quickshell
import QtQuick.Layouts
import QtQuick
import Quickshell.Io

import qs.config as Config
import "../Dashboard/"
//For testing
import qs.services as Services

Scope {
    property bool dashboardOpen: false
    PanelWindow {
        implicitHeight: 3
        anchors {
            top: true
            left: true
            right: true
        }
        color: Config.Theme.colBg
    }
    PanelWindow {
        visible: true
        color: "transparent"
        anchors {
            top: true
            left: true
            right: true
        }

        
        Rectangle {
            anchors.fill: parent
            
            bottomLeftRadius: 5
            bottomRightRadius: 5
            color: Config.Theme.colBg
            

        }
        

        implicitHeight: Config.BarConfig.height
        
        WorkspaceWidget {id: workspaces}

        WindowTitle {}

        /*Rectangle {
            anchors.right: betweenDashAndPower.left
            width: 30
            height: parent.height
            color: "transparent"
            Text {
                anchors.centerIn: parent
                text: "⏻"
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: powerMenu()
            }
        }*/
        
        BarSpacer {id: betweenDashAndPower; anchors.right: dash.left}

        Rectangle {
            id: dash
            anchors.right: betweenBatteryAndDash.left
            width: dashText.width
            height: 30
            color: "transparent"
            Text {
                id: dashText
                text: "Open Dashboard"
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                
                onClicked: dashboard.toggle()
                hoverEnabled: true
                //For testing
                onEntered: console.log(Services.MediaPlayer.players.length + " " + Services.MediaPlayer.players)
            }
        }
        BarSpacer {id: betweenBatteryAndDash; anchors.right: battery.left}
        BatteryWidget {
            id: battery
            anchors.right: betweenMediaAndBattery.left
        }

        BarSpacer {id: betweenMediaAndBattery; anchors.right: clock.left}

        ClockWidget {
            id: clock
            anchors.right: rightSpacer.left
            color: "white"
        }
        BarSpacer {id: rightSpacer; anchors.right: parent.right; width: 5}
    }
    Dashboard {id: dashboard}
    function powerMenu() {
        
        Quickshell.execDetached ({
            command: ["~/.config/nic4k/wlogout.sh"]
        })
        
    }
}