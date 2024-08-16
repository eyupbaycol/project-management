using {sap.fe.cap.project as my} from '../db/schema';


service ProjectService {

    entity Project as projection on my.Project{
        *,
        ProjectID: String @readonly @Common.Text: ProjectName,
        to_Manager.FirstName || ' ' || to_Manager.LastName as ManagerFullName : String,
        @Common.Text: ManagerFullName
        to_Manager,
        
        to_Company.InstutationName as InstutationName: String,
        @Common.Text: InstutationName
        to_Company,
        // ProjectStatus.name as ProjectStatusName,
        // @Common.Text: ProjectStatusName
        // ProjectStatus
    };

    entity Ticket as projection on my.Ticket {
      *,
      TicketForWho.FirstName || ' ' || TicketForWho.LastName as TicketForWhoFullName : String,
      @Common.Text: TicketForWhoFullName
      TicketForWho,

      TicketOwner.FirstName || ' ' || TicketOwner.LastName as TicketOwnerFullName : String,
      @Common.Text: TicketOwnerFullName
      TicketOwner,
    };
    entity Person as projection on my.Person;
    entity Company as projection on my.Company;
    function getTicketsData(ProjectUUID: UUID) returns my.TicketData;

}

annotate ProjectService.Project with @Aggregation.ApplySupported: {
  Transformations       : [
    'aggregate',
    'topcount',
    'bottomcount',
    'identity',
    'concat',
    'groupby',
    'filter',
    'expand',
    'search'
  ],
  Rollup                : #None,
  PropertyRestrictions  : true,
  GroupableProperties   : [
    to_Manager_PersonID,
    to_Company_CompanyID,
    ProjectStatus_code,
  ],
  AggregatableProperties: [
    {Property: ProjectID }
  ],
};