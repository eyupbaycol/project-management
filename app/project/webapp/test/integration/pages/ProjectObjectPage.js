sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.fe.sap.project',
            componentId: 'ProjectObjectPage',
            contextPath: '/Project'
        },
        CustomPageDefinitions
    );
});