sap.ui.define([
    "sap/m/MessageToast",
    "jquery.sap.global"
], function (MessageToast) {
    'use strict';

    return {
        onAfterItemAdded: async function (oEvent) {
            debugger;
            const baseUrl = oEvent.oSource.getModel().getServiceUrl();
            const pattern = /PurchaseOrder\([^)]*\)/; // Adjust the pattern as needed for your context
            const match = window.location.href.match(pattern);
            const entityUrl = match ? match[0] : '';

            const item = oEvent.getParameter("item");
            const data = {
                mediaType: item.getMediaType(),
                fileName: item.getFileName(),
                size: item.getFileObject().size,
                poID: entityUrl.split("(")[1].split(")")[0] // Extracting the ID
            };

            const settings = {
                url: baseUrl + entityUrl + '/TeatoFile',
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                data: JSON.stringify(data)
            };

            try {
                const id = await new Promise((resolve, reject) => {
                    $.ajax(settings)
                        .done((results) => {
                            resolve(results.ID);
                        })
                        .fail((err) => {
                            reject(err);
                        });
                });

                const url = `${baseUrl}Files(ID=${id},IsActiveEntity=false)/content`;
                item.setUploadUrl(url);
                item.setUrl(url);

                const oUploadSet = this.byId("uploadSet");
                oUploadSet.setHttpRequestMethod("PUT");
                oUploadSet.uploadItem(item);
            } catch (error) {
                console.error(error);
                MessageToast.show("Error during file upload.");
            }
        },

        onUploadCompleted: function (oEvent) {
            debugger;
            const oUploadSet = this.byId("uploadSet");
            oUploadSet.removeAllIncompleteItems();
            MessageToast.show("All uploads completed successfully.");
        },

        onOpenPressed: function (oEvent) {
            debugger;
            const baseUrl = oEvent.oSource.getModel().getServiceUrl();
            const fileUrl = oEvent.oSource.mProperties.url;
            const pattern = /Files.*$/;
            const match = fileUrl.match(pattern);
            if (match) {
                const entityUrl = baseUrl + match[0];
                window.open(entityUrl, "_blank"); // Open the file in a new tab
            }
        },

        onAfterItemRemoved: function (oEvent) {
            debugger;
            const baseUrl = oEvent.oSource.getModel().getServiceUrl();
            const regex = /^(.*?),IsActiveEntity=/;

            const match = oEvent.mParameters.item.mProperties.url.match(regex);
            if (match) {
                let urll = match[1] + ",IsActiveEntity=false)";
                urll = urll.replace(/^.*\/Files/, "/Files");

                $.ajax({
                    url: baseUrl + urll,
                    method: "DELETE"
                }).done(() => {
                    MessageToast.show("File removed successfully.");
                }).fail(() => {
                    MessageToast.show("Error removing file.");
                });
            }
        },
    };
});
