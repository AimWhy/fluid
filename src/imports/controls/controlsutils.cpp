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

#include "controlsutils.h"

/*!
    \qmltype Fluid.Controls::Utils
    \inqmlmodule Fluid
    \ingroup fluid

    \brief A collection of helpful utility methods.
*/
ControlsUtils::ControlsUtils(const QUrl &baseUrl, QObject *parent)
    : QObject(parent)
    , m_baseUrl(baseUrl)
{
}

/*!
    \qmlmethod real Fluid::Utils::scale(real percent, real start, real end)

    Scale \a percent in the range between \a start and \a end.
*/
qreal ControlsUtils::scale(qreal percent, qreal start, qreal end)
{
    return start + ((end - start) * (percent / 100));
}

/*!
    \qmlmethod url Fluid::Utils::iconUrl(string name)

    Returns an URL for the Material Design icon \a name.
    Use this URL with Image or icon grouped property with controls.

    \code
    import QtQuick
    import Fluid as Fluid

    Image {
        source: Fluid.Utils.iconUrl("action/alarm")
        width: 64
        height: 64
    }
    \endcode

    \code
    import QtQuick
    import QtQuick.Controls
    import Fluid as Fluid

    Button {
        icon.source: Fluid.Utils.iconUrl("action/alarm")
        text: qsTr("Alarm")
    }
    \endcode
*/
QUrl ControlsUtils::iconUrl(const QString &name)
{
#if FLUID_INSTALL_ICONS == 1
    return QUrl::fromLocalFile(QStringLiteral("%1/icons/%2.svg").arg(m_baseUrl.toLocalFile(), name));
#else
    return QUrl(QStringLiteral("qrc:/liri.io/imports/Fluid/icons/%1.svg").arg(name));
#endif
}

ControlsUtils *ControlsUtils::create(QQmlEngine *engine, QJSEngine *jsEngine)
{
    Q_UNUSED(jsEngine)

    return new ControlsUtils(engine->baseUrl());
}
