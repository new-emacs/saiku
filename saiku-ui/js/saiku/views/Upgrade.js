/*
 *   Copyright 2012 OSBI Ltd
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

/**
 * The global toolbar
 */
var Upgrade = Backbone.View.extend({
    tagName: "div",

    events: {
    },

    template: function() {
        var template = $("<div><div id='uphead' class='upgradeheader'>You are using Saiku Community Edition, please consider upgrading to <a target='_blank' href='http://meteorite.bi'>Saiku Enterprise, or entering a sponsorship agreement with us</a> to support development. <a href='mailto:info@meteorite.bi?subject=Supporting Saiku'>info@meteorite.bi</a></div></div>").html() || "";

        return _.template(template)();
    },

    initialize: function() {

    },

    render: function() {

		var license = new License();

		/*license.fetch_license('api/license/', function(opt) {
			if (opt.status !== 'error') {
				return this;
			}
		});*/

		var v = Settings.VERSION;
		if(v.indexOf("EE")>-1){
			return this;
		}



        var timeout = Saiku.session.upgradeTimeout;
        var localStorageUsed = false;
        var first = true;
        if (typeof localStorage !== "undefined" && localStorage) {
            if (localStorage.getItem("saiku.upgradeTimeout") !== null) {
                timeout = localStorage.getItem("saiku.upgradeTimeout");
            }
            localStorageUsed = true;
        }

        var current = (new Date()).getTime();
        if (!timeout || (current - timeout) > (10 * 60 * 1000)) {
            $(this.el).html(this.template());
            Saiku.session.upgradeTimeout = current;
            if (typeof localStorage !== "undefined" && localStorage) {
                localStorage.setItem("saiku.upgradeTimeout", current);
            }
        }


        return this;
    },

    call: function(e) {
    }

});
