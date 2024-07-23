sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/fe/sap/project/test/integration/FirstJourney',
		'com/fe/sap/project/test/integration/pages/ProjectList',
		'com/fe/sap/project/test/integration/pages/ProjectObjectPage',
		'com/fe/sap/project/test/integration/pages/TicketObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectList, ProjectObjectPage, TicketObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/fe/sap/project') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectList: ProjectList,
					onTheProjectObjectPage: ProjectObjectPage,
					onTheTicketObjectPage: TicketObjectPage
                }
            },
            opaJourney.run
        );
    }
);