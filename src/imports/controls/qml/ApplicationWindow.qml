/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
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

import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Fluid as Fluid
import Fluid.Private as P

ApplicationWindow {
    id: window

    property alias decorationColor: windowDecoration.color

    property alias decorationTheme: windowDecoration.theme

    property alias appBar: appBar

    property alias initialPage: pageStack.initialItem

    property alias pageStack: pageStack

    header: Fluid.AppToolBar {
        id: appBar
    }

    Fluid.PageStack {
        id: pageStack

        anchors.fill: parent

        onPushed: (page) => appBar.push(page)
        onPopped: (page) => appBar.pop(page)
        onReplaced: (page) => appBar.replace(page)
    }

    P.WindowDecoration {
        id: windowDecoration
        window: window
        color: Material.shade(appBar ? appBar.Material.background : window.Material.primaryColor, Material.Shade700)
    }
}
