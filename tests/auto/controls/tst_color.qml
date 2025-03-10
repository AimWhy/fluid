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
import QtTest
import Fluid as Fluid

TestCase {
    name: "ColorTests"

    function test_blend() {
        compare(Fluid.Color.blend("lightsteelblue", "#10FF0000", 0.5), "#7fd8626f");
    }

    function test_luminance() {
        fuzzyCompare(Fluid.Color.luminance("lightsteelblue"), 0.75, 0.01);
    }

    function test_isDarkColor_should_return_true_for_dark_color() {
        compare(Fluid.Color.isDarkColor("#455A64"), true);
    }

    function test_isDarkColor_should_return_false_for_light_color() {
        compare(Fluid.Color.isDarkColor("#B0BEC5"), false);
    }
}
