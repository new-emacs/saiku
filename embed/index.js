(function ($) {

    var myClient = new SaikuClient({
        server: "",
        path: "/rest/saiku/embed",
        user: "admin",
        password: "admin"
    });


    var AppRouter = Backbone.Router.extend({
        routes: {
            "mdxtable/*path": "showMdxTable",
            "mdxchart/*path": "showMdxChart",
            "table/*path": "showTable",
            "chart/*path": "showChart"
        },
        getPost: function(id) {
            alert(id);
        },
        showTable: function(path){
            myClient.execute({
                file: path,
                htmlObject: "#saiku",
                render: "table",
                params: {
                    family: "testparameter"
                }
            });

        },

        showChart: function (path){

            myClient.execute({
                file: path,
                htmlObject: "#saiku2",
                render: "chart",
                mode: "stackedBar",
                chartDefinition: {
                    colors: ['grey','red','blue'],
                    extensionPoints: {
                        xAxisLabel_textAngle: - Math.PI/3,
                        panel_fillStyle: "#EAEAEA"
                    }
                },
                zoom: true

            });
        },

        showMdxTable: function(path){
            myClient.executeMdx({
                file: path,
                htmlObject: "#saiku",
                render: "table",
                connection:'saiku_JDCompass',
                catalog:'JDCompass',
                schema:'JDCompass',
                cube:'SFSReal',
                formatter:'flattened',
                limit:0,
                "mdx": $('#mdx').val(),
                params: {
                    family: "testparameter"
                }
            });

        },

        showMdxChart: function (path){

            myClient.executeMdx({
                file: path,
                htmlObject: "#43",
                connection:'saiku_dashboard',
                catalog:'Sone',
                schema:'Sone',
                cube:'SalesMoneyReportv2',
                formatter:'flattened',
                limit:0,
                "mdx": $('#mdx').val(),
                render: "chart",
                mode: "stackedBar",
                chartDefinition: {
                    colors: ['grey','red','blue'],
                    extensionPoints: {
                        xAxisLabel_textAngle: - Math.PI/3,
                        panel_fillStyle: "#EAEAEA"
                    }
                },
                zoom: true

            });
        },
        defaultRoute : function(actions){
            alert(actions);
        },
        downloadFile: function( path ){
            alert(path); // user/images/hey.gif
        },
        loadView: function( route, action ){
            alert(route + "_" + action); // dashboard_graph
        }
    });

    var app_router = new AppRouter;

    Backbone.history.start();

})(jQuery);
