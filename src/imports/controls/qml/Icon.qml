/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2018 Michael Spencer <sonrisesoftware@gmail.com>
 * Copyright (C) 2015 Bogdan Cuza <bogdan.cuza@hotmail.com>
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
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Material
import Fluid

/*!
    \brief Displays an icon from the Material Design icon collection, the platform's icon theme,
    or another (local or remote) location.

    To use an icon from the <a href="https://materialdesignicons.com/">Material Design icon collection</a>,
    set the \c name property to the name of the icon in its group in the form of \c group/icon_name. For example:
    \code{.qml}
    Icon {
        name: "action/settings"
    }
    \endcode

    This icon will by default use the light icon color from Material Design. To use the dark icon
    color:
    \code{.qml}
    Icon {
        Material.theme: Material.Dark

        name: "action/settings"
    }
    \endcode

    In addition to using icons from Material Design, you can also use icons from the platform's
    <a href="http://standards.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html">Freedesktop icon theme</a>. For example:

    \code{.qml}
    Icon {
        name: "gimp"
    }
    \endcode

    By default, icons from the Freedesktop icon theme are not colorized unless they include the word "symbolic" in the icon name. For example, "gimp" would be full-colored by "edit-cut-symbolic" would be colored using the set \c color property (based off of \c Material.theme). If you need to colorize an icon manually, you can do so like this:

    \code{.qml}
    Icon {
        name: "gimp"
        colorize: true
    }
    \endcode

    You can also use custom icons like this:
    \code{.qml}
    Icon {
        source: Qt.resolvedUrl("icons/fun_icon.png")
    }
    \endcode
*/
Item {
    id: icon

    /*!
        The color of the icon. Defaults to \c Material.iconColor.
    */
    property color color: Material.iconColor

    /*!
        The size of the icon. Defaults to 24px.
    */
    property real size: 24

    /*!
        The name of the icon to display.

        \sa Fluid.Controls::Icon::source
    */
    property string name

    /*!
        \brief A URL pointing to an image to display as the icon.

        By default, this is a special URL representing the icon named by \l name from the Material
        Design icon collection when using the form of "collection/icon_name", or in the case of a
        single "icon_name", the platform's Freedesktop icon theme will be used.

        By default, icons from the Material Design icons collection will be treated as symbolic icons and colored using the specified \l color, while icons from the Freedesktop icon theme will
        not be colorized. To override this, or set the behavior for your own custom icons, use
        \l colorize.

        \sa Fluid.Controls::Icon::name
    */
    property url source: {
        return name ? name.indexOf("/") === 0 || name.indexOf("file://") === 0 || name.indexOf("qrc") === 0
                      ? name : "image://fluidicontheme/" + name
                    : "";
    }

    /*!
        \list
            \li Image.Null - no image has been set
            \li Image.Ready - the image has been loaded
            \li Image.Loading - the image is currently being loaded
            \li Image.Error - an error occurred while loading the image
        \endlist
    */
    property alias status: image.status

    /*!
        Specifies whether the image should be cached.
        The default value is true.

        Setting cache to false is useful when dealing with large images,
        to make sure that they aren't cached at the expense of small
        'ui element' images.
    */
    property alias cache: image.cache

    /*!
        \c true if the icon is valid and fully loaded.
    */
    readonly property bool valid: image.status == Image.Ready

    /*!
        Set to \c false if you want the icon to use the original image's colors and not be
        colored using the specified \c color.
    */
    property bool colorize: (String(icon.source).indexOf(".color.") === -1 &&
                             String(icon.source).indexOf("image://fluidicontheme/") === -1) ||
                            String(icon.source).indexOf("symbolic") !== -1 ||
                            (String(icon.source).indexOf("image://fluidicontheme/") !== -1 &&
                             icon.name.indexOf("/") !== -1)

    /*!
        Source image size.
    */
    readonly property real sourceSize: String(icon.source).indexOf("image://fluidicontheme/") === 0 ? Units.roundToIconSize(size) : size

    width: size
    height: size

    Image {
        id: image

        anchors.fill: parent
        visible: !colorize

        source: icon.source

        sourceSize {
            width: icon.sourceSize * Screen.devicePixelRatio
            height: icon.sourceSize * Screen.devicePixelRatio
        }
    }

    ColorOverlay {
        id: overlay

        anchors.fill: parent
        source: image
        color: Color.transparent(icon.color, 1)
        cached: true
        visible: icon.valid && colorize
        opacity: icon.color.a
    }
}
