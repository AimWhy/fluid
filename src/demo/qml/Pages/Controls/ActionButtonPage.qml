/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick
import QtQuick.Controls
import Fluid as Fluid
import "../.." as Components

Components.StyledPageTwoColumns {
    leftColumn: Column {
        anchors.centerIn: parent

        Fluid.TitleLabel {
            text: qsTr("Enabled")
        }

        Fluid.FloatingActionButton {
            icon.source: Fluid.Utils.iconUrl("device/airplanemode_active")
            mini: false
        }

        Fluid.FloatingActionButton {
            icon.source: Fluid.Utils.iconUrl("navigation/check")
            highlighted: true
            mini: false
        }

        Fluid.FloatingActionButton {
            icon.source: Fluid.Utils.iconUrl("device/airplanemode_active")
            mini: true
        }

        Fluid.FloatingActionButton {
            icon.source: Fluid.Utils.iconUrl("navigation/check")
            highlighted: true
            mini: true
        }
    }

    rightColumn: Column {
        anchors.centerIn: parent

        Fluid.TitleLabel {
            text: qsTr("Disabled")
        }

        Fluid.FloatingActionButton {
            icon.source: Fluid.Utils.iconUrl("device/airplanemode_active")
            mini: false
            enabled: false
        }

        Fluid.FloatingActionButton {
            icon.source: Fluid.Utils.iconUrl("navigation/check")
            highlighted: true
            mini: false
            enabled: false
        }

        Fluid.FloatingActionButton {
            icon.source: Fluid.Utils.iconUrl("device/airplanemode_active")
            mini: true
            enabled: false
        }

        Fluid.FloatingActionButton {
            icon.source: Fluid.Utils.iconUrl("navigation/check")
            highlighted: true
            mini: true
            enabled: false
        }
    }
}
