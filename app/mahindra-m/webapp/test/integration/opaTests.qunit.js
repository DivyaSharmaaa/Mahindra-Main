sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'mahindram/test/integration/FirstJourney',
		'mahindram/test/integration/pages/PurchaseEnquiryList',
		'mahindram/test/integration/pages/PurchaseEnquiryObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseEnquiryList, PurchaseEnquiryObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('mahindram') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseEnquiryList: PurchaseEnquiryList,
					onThePurchaseEnquiryObjectPage: PurchaseEnquiryObjectPage
                }
            },
            opaJourney.run
        );
    }
);