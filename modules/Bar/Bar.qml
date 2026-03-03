import Quickshell
import QtQuick.Layouts
import QtQuick
import "../../config" as Config
import "../Dashboard"

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
        

        Rectangle {
            anchors.right: battery.left
            width: 40
            height: 30
            Text {
                text: "hi"
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                
                onClicked: dashboard.toggle()
            }
        }
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
}