import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import QtQuick
import QtQuick.Controls
import qs.Types
import qs.modules.SettingsMenu

import qs.config as Config

Scope {
    
    IpcHandler {
        target: "dashboard"
        function toggle(): void {
            dashboardPanel.visible = !dashboardPanel.visible
        }
    }

    function toggle(): void {
        dashboardPanel.visible = !dashboardPanel.visible
    }
    

    
    
    property string currentTab: "media"
    property int numButtons: 3
    PanelWindow {
        /*PanelWindow {
            exclusionMode: ExclusionMode.Ignore
            focusable: false
            anchors {
                top:true
                left:true
                right:true
                bottom:true
            }
            visible: dashboardPanel.visible
            color: "transparent"
            MouseArea {
                anchors.fill: parent
                onClicked: dashboardPanel.visible = false
            }
        }*/
        visible: false
        id: dashboardPanel
        exclusiveZone: 0
        //color: Config.Theme.colBg
        color: "transparent"
        anchors {
            top: true
        }
        Rectangle {
            anchors.fill: parent
            color: Config.Theme.colBg
            bottomLeftRadius: 30
            bottomRightRadius: 30
            //radius: 30
            //topRightRadius: 30
        }
        implicitWidth: media.width + 50 // change this to not change and be a good width
        implicitHeight: media.height + 15 + tabBar.height

        Rectangle {
            id: tabBar
            width: parent.width
            height: 30
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"
            Rectangle {
                color: currentTab == "media" ? Config.Theme.activeTab : Config.Theme.inactiveTab
                anchors.left: parent.left
                anchors.top: parent.top
                id: mediaButton
                height: parent.height
                
                implicitWidth: parent.width / numButtons
                Text {
                    text: "media"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: currentTab = "media"
                }
            }
            Rectangle {
                color: currentTab == "power" ? Config.Theme.activeTab : Config.Theme.inactiveTab
                anchors.left: mediaButton.right
                id: powerButton
                height: parent.height
                width: parent.width / numButtons
                Text {
                    text: "power"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: currentTab = "power"
                }
            }
            Rectangle {
                color: currentTab == "settings" ? Config.Theme.activeTab : Config.Theme.inactiveTab
                anchors.left: powerButton.right
                id: settingsButton
                height: parent.height
                width: parent.width / numButtons
                Text {
                    text: "settings"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: currentTab = "settings"
                }
            }
        }

        /*TabBar {
            id: tabBar
            implicitWidth: parent.width
            
            TabButton {
                //border.width: 0
                anchors.left: parent.left
                text: "media"
                id: mediaButton
            }
            TabButton {
                anchors.left: mediaButton.right
                text: "power"
                id: powerButton
            }
            
            
        }
        */
        Media {
            visible: currentTab == "media"
            id: media
            anchors.top: tabBar.bottom
            anchors.topMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.centerIn: parent 
            //implicitHeight: 60
            
        }
        Power {
            visible: currentTab == "power"
            id: power
            anchors.top: tabBar.bottom
            anchors.topMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
        }
        QuickSettings {
            visible: currentTab == "settings"
            anchors.top: tabBar.bottom
            anchors.topMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height - tabBar.height
            width: parent.width - 60
        }
    }
    
}