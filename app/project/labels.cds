using { sap.fe.cap.project as schema } from '../../db/schema';

annotate schema.Project with {
    ProjectUUID @UI.Hidden;
    ProjectID    @title: '{i18n>ProjectID}'  @Common.Text: ProjectName;
    to_Manager  @title: '{i18n>ManagerID}'    @Common.Text: to_Manager.LastName;
    ProjectStatus @title: '{i18n>ProjectStatus}'  @Common.Text: ProjectStatus.name     @Common.TextArrangement: #TextOnly;
};


annotate schema.Ticket with {
  TicketStatus @title : '{i18n>TicketStatus}' @Common.Text: TicketStatus.name  @Common.TextArrangement: #TextOnly;
  TicketPriority @title : '{i18n>TicketPriority}' @Common.Text: TicketPriority.name  @Common.TextArrangement: #TextOnly;
} ;



annotate schema.Person with {
  PersonID   @title: '{i18n>PersonID}'    @Common.Text: LastName;
  FirstName    @title: '{i18n>FirstName}';
  LastName     @title: '{i18n>LastName}';
  Title        @title: '{i18n>Title}';
  Street       @title: '{i18n>Street}';
  PostalCode   @title: '{i18n>PostalCode}';
  City         @title: '{i18n>City}';
  CountryCode  @title: '{i18n>CountryCode}';
  PhoneNumber  @title: '{i18n>PhoneNumber}';
  EMailAddress @title: '{i18n>EMailAddress}';
};

annotate schema.Company with {
    CompanyID @title: '{i18n>CompanyID}'    @Common.Text: InstutationName;
    InstutationName  @title: '{i18n>InstutationName}';
    WebAddress  @title: '{i18n>WebAddress}';
    TaxNumber  @title: '{i18n>TaxNumber}';
};



