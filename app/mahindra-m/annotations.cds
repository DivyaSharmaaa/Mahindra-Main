using MyService as service from '../../srv/service';
annotate service.PurchaseEnquiry with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'purchaseEnquiryID',
                Value : purchaseEnquiryID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'vehicleCode',
                Value : vehicleCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'customerID',
                Value : customerID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'deliveryLocation',
                Value : deliveryLocation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'vehicleName',
                Value : vehicleName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'vehicleColor',
                Value : vehicleColor,
            },
            {
                $Type : 'UI.DataField',
                Label : 'quantity',
                Value : quantity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Enquiry Details  ',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'customerID',
            Value : customerID,
        },
    ],
);

annotate service.PurchaseOrder with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Po Details',
            ID : 'PoDetails',
            Target : '@UI.FieldGroup#PoDetails',
        },
    ],
    UI.FieldGroup #PoDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : poID,
                Label : 'poID',
            },
            {
                $Type : 'UI.DataField',
                Value : quotationID,
                Label : 'quotationID',
            },
            {
                $Type : 'UI.DataField',
                Value : deliveryLocation,
                Label : 'deliveryLocation',
            },
            {
                $Type : 'UI.DataField',
                Value : contactPerson,
                Label : 'contactPerson',
            },
            {
                $Type : 'UI.DataField',
                Value : companyName,
                Label : 'companyName',
            },
            {
                $Type : 'UI.DataField',
                Value : address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : distributionChannel,
                Label : 'distributionChannel',
            },
            {
                $Type : 'UI.DataField',
                Value : division,
                Label : 'division',
            },
            {
                $Type : 'UI.DataField',
                Value : documentType,
                Label : 'documentType',
            },
            {
                $Type : 'UI.DataField',
                Value : phoneNumber,
                Label : 'phoneNumber',
            },
            {
                $Type : 'UI.DataField',
                Value : emailAddress,
                Label : 'emailAddress',
            },
            {
                $Type : 'UI.DataField',
                Value : salesOrg,
                Label : 'salesOrg',
            },
            {
                $Type : 'UI.DataField',
                Value : van,
                Label : 'van',
            },
        ],
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : poID,
            Label : 'poID',
        },
    ],
);

