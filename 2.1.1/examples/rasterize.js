"use strict";

var page = require('webpage').create(),
    system = require('system'),
    address, output;

if (system.args.length != 3) {
    console.log('Usage: rasterize.js URL filename');

    phantom.exit(1);
} else {
    address = system.args[1];
    output = system.args[2];

    page.viewportSize = {
        width: 1024,
        height: 600
    };
    page.onConsoleMessage = function (msg, lineNum, sourceId) {
        console.log(msg);
    };
    page.open(address, function (status) {
        if (status !== 'success') {
            console.log('Unable to load the address!');

            phantom.exit(1);
        } else {
            page.evaluate(function () {
                document.body.bgColor = "white";
            });

            window.setTimeout(function () {
                page.render(output);

                phantom.exit();
            }, 200);
        }
    });
}
