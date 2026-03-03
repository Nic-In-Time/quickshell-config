import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import QtQuick

import "../../config" as Config

Scope {
    
    function toggle(): void {
        dashboardPanel.visible = !dashboardPanel.visible
    }
    PanelWindow {
        visible: false
        id: dashboardPanel
        exclusiveZone: 0
        color: Config.Theme.colBg
        anchors {
            top: true
        }
        implicitWidth: media.width + 50
        implicitHeight: media.height + 15
        Media {
            id: media
            anchors.centerIn: parent 
            implicitHeight: 60
        }
    }
    
}