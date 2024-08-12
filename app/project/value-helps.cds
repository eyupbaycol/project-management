using { sap.fe.cap.project as my } from '../../db/schema';




annotate my.Project  with @(
 Capabilities: {
        FilterRestrictions     : {FilterExpressionRestrictions : [
        {
            Property           : 'BeginDate',
            AllowedExpressions : 'SingleRange'
        },{
            Property           : 'EndDate',
            AllowedExpressions : 'SingleRange'
        }]}
    }) {
     ProjectStatus @Common.ValueListWithFixedValues;
     to_Manager @Common.ValueList: {
     CollectionPath : 'Person',
     Label : 'Person ID',
     Parameters : [
       {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: to_Manager_PersonID, ValueListProperty: 'PersonID'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'FirstName'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'LastName'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Title'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Street'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'PostalCode'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'City'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'CountryCode_code'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'PhoneNumber'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'EMailAddress'}
     ]
   };
   to_Company @Common.ValueList: {
     CollectionPath : 'Company',
     Label : 'Company ID',
     Parameters : [
       {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: to_Company_CompanyID, ValueListProperty: 'CompanyID'},
       {$Type: 'Common.ValueListParameterDisplayOnly',  ValueListProperty: 'InstutationName'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'WebAddress'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'TaxNumber'}
     ]
   };

    


}


annotate my.Ticket with {

  TicketStatus @Common.ValueListWithFixedValues;
  TicketPriority @Common.ValueListWithFixedValues;
  TicketForWho @Common.ValueList: {
     CollectionPath : 'Person',
     Label : 'Person ID',
     Parameters : [
       {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: TicketForWho_PersonID, ValueListProperty: 'PersonID'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'FirstName'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'LastName'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Title'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Street'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'PostalCode'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'City'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'CountryCode_code'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'PhoneNumber'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'EMailAddress'}
     ]
   };
   TicketOwner @Common.ValueList: {
     CollectionPath : 'Person',
     Label : 'Person ID',
     Parameters : [
       {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: TicketOwner_PersonID, ValueListProperty: 'PersonID'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'FirstName'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'LastName'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Title'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Street'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'PostalCode'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'City'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'CountryCode_code'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'PhoneNumber'},
       {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'EMailAddress'}
     ]
   };
}  ;
