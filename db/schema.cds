using {custom.managed, sap.common.CodeList, Country } from './common';
// using { Attachments } from '@cap-js/attachments';

namespace sap.fe.cap.project;

entity Project : managed {
    key ProjectUUID: UUID;
    ProjectID       : Integer @readonly default 0;
    BeginDate      : Date;
    EndDate        : Date;
    to_Company: Association to Company;
    Description    : String(1024);
    to_Manager : Association to Person;
    ProjectStatus : Association to ProjectStatus;
    to_Ticket     : Composition of many Ticket on to_Ticket.to_Project = $self;
    ProjectName : String(100); 
    // attachments : Composition of Attachments;
}


entity Company : managed {
    key CompanyID : String(6);
    InstutationName : String(100);
    WebAddress : String(100);
    TaxNumber : String(11);
}

entity Ticket : managed {
    key TicketUUID : UUID;
    TicketID : Integer @Core.Computed;
    TicketOwner: Association to Person;
    TicketForWho : Association to Person;
    TicketSubject : String(100);
    BeginDate: Date;
    EndDate : Date default null;
    TicketPriority: Association to TicketPriority;
    TicketStatus : Association to TicketStatus; 
    to_Project : Association to Project;
    to_Comment : Composition of many Comment on to_Comment.to_Ticket = $self;
}

entity Comment : managed {
  key CommentUUID: UUID;
  CommentID : Integer @Core.Computed;
  CommentOwner : Association to Person;
  Message : String;
  to_Ticket: Association to Ticket;
}

entity Person : managed {
  key PersonID : String(6);
  FirstName      : String(40);
  LastName       : String(40);
  Title          : String(10);
  Street         : String(60);
  PostalCode     : String(10);
  City           : String(40);
  CountryCode    : Country;
  PhoneNumber    : String(30);
  EMailAddress   : String(256);
}


entity TicketStatus: CodeList {
    key code : String enum {
    Accepted = 'A';
    Canceled = 'X';
    Open = 'O';
  } default 'O';
  criticality : Integer; //  2: yellow colour,  3: green colour, 0: unknown
} 


entity TicketPriority : CodeList {
    key code : String enum {
    VeryHigh = 'V';
    Heigh = 'H';
    Middle = 'M';
    Low = 'L';
    VeryLow = 'VL';
  } default 'L';
  criticality : Integer; //  2: yellow colour,  3: green colour, 0: unknown
}

entity ProjectStatus : CodeList {
    key code : String enum {
    Open     = 'O';
    Accepted = 'A';
    Canceled = 'X';
  } default 'O'; //> will be used for foreign keys as well
  criticality : Integer; //  2: yellow colour,  3: green colour, 0: unknown
}


type TicketData: {
  TotalTicketsCount: Integer;
  AcceptedTicketsCount: Integer;
  CancelledTicketsCount: Integer;
  NewTicketsCount: Integer;
}