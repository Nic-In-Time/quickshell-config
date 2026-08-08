import Quickshell
import QtQuick.Layouts
import QtQuick

import "modules/Bar/"
import "modules/Launcher/"
import "modules/Dashboard/power/"
import "modules/WorkspaceSwitcher/"
import "modules/Notification/"
import qs.modules.SettingsMenu

ShellRoot {
    Scope {
        AppLauncher {}
        /*PanelWindow {
            Flickable {
                clip: true
                Text {
                    text: "alsjdflaksjdfasdlkjhflkhajsdflk"

                }
            }
        }*/
        Bar {}
        WorkspaceSwitcher {}
        SettingsMenu {}
        Notifications {}
    }
}
