/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2018 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick.Controls
import Fluid as Fluid

Fluid.Page {
    title: "Sub page demo"

    actions: [
        Fluid.Action {
            icon.source: Fluid.Utils.iconUrl("action/settings")
            toolTip: qsTr("Settings")
            hoverAnimation: true
        }
    ]

    Label {
        anchors.centerIn: parent
        text: "Testing"
    }
}
