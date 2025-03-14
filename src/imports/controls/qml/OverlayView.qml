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

/*!
    \brief Ready made popup centered on its parent.

    This controls provides a ready made popup visual element that can be
    used with \ref Window or \ref ApplicationWindow.

    Overlay is centered to its parent. In order to ensure it is displayed
    above other items in the scene, it is recommended to use \ref ApplicationWindow.
    \ref ApplicationWindow also provides background dimming effects since \ref Overlay
    acts as a modal popup.
*/
Popup {
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    modal: true
    padding: 0
    background: Item {}
}
