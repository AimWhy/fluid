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

import QtQuick
import Qt5Compat.GraphicalEffects

/*!
  \brief A implementation of CSS's box-shadow.

  A implementation of CSS's box-shadow, used by Elevation for a Material Design
  elevation shadow effect.
*/
RectangularGlow {
    /*!
        Position of the horizontal shadow.
    */
    property int offsetX

    /*!
        Position of the vertical shadow.
    */
    property int offsetY

    /*!
        Blur distance.
    */
    property int blurRadius

    /*!
        Size of shadow.
    */
    property int spreadRadius

    /*!
        The source item the shadow is being applied to, used for correctly
        calculating the corner radius.
    */
    property Item source

    /*!
        Whether the shadow width is calculated based on the parent width.
    */
    property bool fullWidth

    /*!
        Whether the shadow height is calculated based on the parent height.
    */
    property bool fullHeight

    x: (parent.width - width)/2 + offsetX
    y: (parent.height - height)/2 + offsetY

    implicitWidth: source ? source.width : parent.width
    implicitHeight: source ? source.height : parent.height

    width: implicitWidth + 2 * spreadRadius + (fullWidth ? 2 * cornerRadius : 0)
    height: implicitHeight + 2 * spreadRadius + (fullHeight ? 2 * cornerRadius : 0)
    glowRadius: blurRadius/2
    spread: 0.05
    cornerRadius: blurRadius + (source && source.radius || 0)
}
