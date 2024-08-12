using {ProjectService} from '../../srv/project-service.cds';

annotate ProjectService.Project with @odata.draft.enabled;
annotate ProjectService.Project with @Common.SemanticKey: [ProjectID];
annotate ProjectService.Ticket with @Common.SemanticKey: [TicketID];