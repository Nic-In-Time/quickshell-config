import Quickshell
import QtQuick.Layouts
import QtQuick

import "modules/Bar"
import "modules/Launcher"

ShellRoot{
    Scope {
        AppLauncher {}
        
        Bar {}
        
    }
}

