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
import QtQuick.Layouts
import Fluid as Fluid
import "../.." as Components

Components.StyledPageTwoColumns {
    leftColumn: ColumnLayout {
        anchors.centerIn: parent

        Fluid.TitleLabel {
            text: qsTr("Enabled")

            Layout.alignment: Qt.AlignHCenter
        }

        Fluid.Switch {
            checked: true
            text: checked ? qsTr("On") : qsTr("Off")
        }

        Fluid.Switch {
            checked: false
            checkable: false
            text: qsTr("Off")
        }
    }

    rightColumn: ColumnLayout {
        anchors.centerIn: parent

        Fluid.TitleLabel {
            text: qsTr("Disabled")

            Layout.alignment: Qt.AlignHCenter
        }

        Fluid.Switch {
            enabled: false
            checked: true
            text: checked ? qsTr("On") : qsTr("Off")
        }

        Fluid.Switch {
            enabled: false
            checked: false
            checkable: false
            text: qsTr("Off")
        }
    }
}
