

module.exports = cds.service.impl(async function () {

this.before('CREATE', 'PurchaseOrder', async (req) => {
    debugger


    // var sUrll = 'PurchaseEnquiry(purchaseEnquiryID=';
    // var y = req.data.purchaseEnquiryID;
    // var z = ',IsActiveEntity=true)/TeatoFile';
    // var sUrl = sUrll + y + z;

    var sUrl = "PurchaseOrder(poID='" + req.data.poID + "',IsActiveEntity=true)/TeatoFile";
    var data =

  
    {
        "definitionId": "us10.3e1cae61trial.mahindraproject.po",
        "context": {
            "poid": req.data.poID,
            "quotationid": req.data.quotationID,
            "deliverylocation": req.data.deliveryLocation,
            "link": sUrl,
            "companyname": req.data.companyName,
            "contactperson": req.data.contactPerson ,
            "phonenumber":  req.data.phoneNumber  ,
            "emailaddress":  req.data.emailAddress  ,
            "van":  req.data.van ,
            "address":  req.data.address   ,
            "documenttype":  req.data.documentType ,
            "salesorg":  req.data.salesOrg ,
            "distributionchannel":  req.data.distributionChannel ,
            "division":  req.data.division 
        }
    }
    
    console.log(data);

    var BpaDest = await cds.connect.to("BpaDest");
    debugger
    var result = await BpaDest.post('/workflow/rest/v1/workflow-instances', data);
    console.log(result);
    debugger



});


this.before('CREATE', 'Files', req => {
    console.log('Create called')
    console.log(JSON.stringify(req.data))
    req.data.url = `/odata/v4/my/Files(${req.data.ID})/content`
})


this.before('UPDATE', 'PurchaseOrder', fileUpload);
this.before('CREATE', 'PurchaseOrder', fileUpload);
async function fileUpload(req){
if(req.data.TeatoFile){
    for (const stud of req.data.TeatoFile) { 
            stud.url = `Files(ID=${stud.ID},IsActiveEntity=true)/content`
    }
}
}     
});



