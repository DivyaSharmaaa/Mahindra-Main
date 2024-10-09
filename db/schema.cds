namespace db;


entity Customer {
  key customerID        : String;
      name              : String;
      address           : String;
      status            : String;
      customerToEnquiry : Association to many PurchaseEnquiry
                            on customerToEnquiry.enquiryToCustomer = $self;
}

entity PurchaseEnquiry {
  key purchaseEnquiryID  : String;
      customerID         : String;
      deliveryLocation   : String;
      status             : String;
      enquiryToCustomer  : Association to one Customer
                             on enquiryToCustomer.customerID = customerID;
      enquiryToVehicle   : Composition of many Vehicle
                             on enquiryToVehicle.vehicleToEnquiry = $self;
      enquiryToQuotation : Association to many Quotation
                             on enquiryToQuotation.quototionToEnquiry = $self;

}

entity Quotation {
  key quotationID         : String;
      customerID          : String;
      purchaseEnquiryID   : String;
      totalPrice          : Decimal;
      deliveryLeadTime    : String;
      validity            : Date;
      quotationToCustomer : Association to one Customer
                              on quotationToCustomer.customerID = customerID;
      quototionToEnquiry  : Association to one PurchaseEnquiry
                              on quototionToEnquiry.purchaseEnquiryID = purchaseEnquiryID;
      quotationToPurchase : Association to one PurchaseOrder
                              on quotationToPurchase.purchaseToQuotation = $self;
}

entity PurchaseOrder {
  key poID                : String;
      quotationID         : String;
      deliveryLocation    : String; 
      companyName         : String;
      contactPerson       : String;
      phoneNumber         : String;
      emailAddress        : String;
      van                 : String;
      address             : String;
      documentType        : String;
      salesOrg            : String;
      distributionChannel : String;
      division            : String;
      TeatoFile           : Composition of many Files
                              on TeatoFile.FiletoTea = $self;
      purchaseToQuotation : Association to one Quotation
                              on purchaseToQuotation.quotationID = quotationID;
      purchaseToSales     : Association to one SalesOrder
                              on purchaseToSales.salesToPurchase = $self;
}

entity SalesOrder {
  key soID            : String;
      poID            : String;
      dealerCode      : String;
      price           : Decimal;
      taxes           : Decimal;
      discount        : Decimal;
      salesToPurchase : Association to one PurchaseOrder
                          on salesToPurchase.poID = poID;
      salesToPayment  : Association to one PaymentDetails
                          on salesToPayment.paymentToSales = $self;
}

entity Stocks {
  key vehicleCode  : String;
      vehicleName  : String;
      vehicleColor : String;
      quantity     : Int16;
      pricePerUnit : Decimal;
}

entity PaymentDetails {
  key paymentId      : String;
      transactionId  : String;
      accountNo      : String;
      amount         : String;
      paymentMethod  : String;
      status         : String;
      soID           : String;
      paymentToSales : Association to many SalesOrder
                         on paymentToSales.soID = soID;

}

entity Invoice {
  key invoiceID        : String;
      paymentId        : String;
      billedTo         : String;
      invoiceDate      : String;
      invoiceStatus    : String;
      invoiceToPayment : Association to one PaymentDetails
                           on invoiceToPayment.paymentId = paymentId
}

entity Comment {
  key commentID       : String;
      createdBy       : String;
      createdAt       : String;
      commentText     : String;
}


entity Vehicle {
  key vehicleCode       : String;
      purchaseEnquiryID : String;
      vehicleName       : String;
      vehicleColor      : String;
      quantity          : Int16;
      price             : Decimal;
      discount          : Decimal;
      finalAmount       : Decimal;
      vehicleToEnquiry  : Association to one PurchaseEnquiry
                            on vehicleToEnquiry.purchaseEnquiryID = purchaseEnquiryID;
}

using {
  cuid,
  managed
} from '@sap/cds/common';

entity Files : cuid, managed {
  poID      : String;

  @Core.MediaType  : mediaType
  content   : LargeBinary;

  @Core.IsMediaType: true
  mediaType : String;
  fileName  : String;
  size      : Integer;
  url       : String;
  FiletoTea : Association to many PurchaseOrder
                on FiletoTea.poID = poID;
}
