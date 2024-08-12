sap.ui.define(['sap/ui/core/mvc/ControllerExtension',"sap/ui/core/message/Message","sap/ui/core/MessageType","sap/ui/model/json/JSONModel"], function (ControllerExtension,Message, MessageType,JSONModel) {
	'use strict';

	return ControllerExtension.extend('com.fe.sap.project.ext.controller.ProjectOBExtend', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf com.fe.sap.project.ext.controller.ProjectOBExtend
             */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
			},
			routing: {
				onAfterBinding: async function (oBindingContext) {
					debugger
					const 
					oExtensionAPI = this.base.getExtensionAPI(),
					oModel = oExtensionAPI.getModel(),
					sFunctionName = "getTicketsData",
					oFunction = oModel.bindContext(`/${sFunctionName}(...)`);
					  const ticketsModel = new JSONModel({
						totalTicketsCount: 0,
						acceptedTicketsCount: 0,
						cancelledTicketsCount: 0,
						newTicketsCount: 0
					});
					this.base.getView().setModel(ticketsModel, "ticketsModel");
					const oProject = await oBindingContext.requestObject(oBindingContext.getPath());
					oFunction.setParameter("ProjectUUID", oProject.ProjectUUID);
					await oFunction.execute();
					const oContext = oFunction.getBoundContext();
					ticketsModel.setProperty("/totalTicketsCount", oContext.getProperty("TotalTicketsCount"));
					ticketsModel.setProperty("/acceptedTicketsCount", oContext.getProperty("AcceptedTicketsCount"));
					ticketsModel.setProperty("/cancelledTicketsCount", oContext.getProperty("CancelledTicketsCount"));
					ticketsModel.setProperty("/newTicketsCount", oContext.getProperty("NewTicketsCount"));
					}
			
			}
		}
	});
});
