sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        // onPost: function(oEvent) {
        //     var oList = this.byId("comment_list"),
		// 		oBinding = oList.getBinding("items"),
		// 		oContext = oBinding.create({
		// 			"CommentOwner_PersonID" : "000006",
        //             "Message": oEvent.mParameters.value
					
		// 		});

		// 	oContext.created().then(function () {
		// 		oBinding.refresh();
		// 	});
        // }
        onPost:  async function(oEvent) {
            const oContext = oEvent.getSource().getBindingContext()
            var oModel = oContext.getModel()
            const oProject = await oContext.requestObject(oContext.getPath());
            // const oAction = oModel.bindContext("/setComment(...)")
            const oAction = oModel.bindContext("/setComment(...)", oContext)
            oAction.setParameter("to_Ticket_TicketUUID", oProject.TicketUUID);
            oAction.setParameter("Message", oEvent.mParameters.value);
            oAction.setParameter("User", "000006");
            oAction.execute().then(
                function() {
                    this.refresh()
                }.bind(this)
            )
        }
    };
});
