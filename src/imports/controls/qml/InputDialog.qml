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
import QtQuick.Controls
import Fluid as Fluid

Dialog {
    id: dialog

    property alias textField: textField
    property alias text: dialogLabel.text

    focus: true
    modal: true
    standardButtons: Fluid.Dialog.Ok | Fluid.Dialog.Cancel

    ColumnLayout {
        anchors {
            left: parent.left
            top: parent.top
        }
        width: parent.width

        Fluid.DialogLabel {
            id: dialogLabel
            wrapMode: Text.Wrap
            visible: text !== ""

            Layout.fillWidth: true
        }

        TextField {
            id: textField
            focus: true
            onAccepted: dialog.accept()

            Layout.fillWidth: true
        }
    }
}
