using {sap.fe.cap.project as my} from '../db/schema';


service ProjectService {

    entity Project as projection on my.Project;
    entity Ticket as projection on my.Ticket;
    

}