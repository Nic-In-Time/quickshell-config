import Quickshell
import QtQuick.Layouts
import QtQuick

import "modules/Bar/"
import "modules/Launcher/"
import "modules/Dashboard/power/"
import "modules/WorkspaceSwitcher/"

ShellRoot{
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
    }
}

