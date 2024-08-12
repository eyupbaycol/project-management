const cds = require('@sap/cds'); require('./workarounds')

class ProjectService extends cds.ApplicationService {
  init() {

    /**
     * Reflect definitions from the service's CDS model
     */
    const { Project, Ticket } = this.entities

    this.before('CREATE', 'Project', async req => {
      const { maxID } = await SELECT.one`max(ProjectID) as maxID`.from(Project)
      req.data.ProjectID = maxID + 1
    })

    this.before('NEW', 'Ticket', async (req) => {
      const { to_Project_ProjectUUID } = req.data
      const { status } = await SELECT`ProjectStatus_code as status`.from(Project.drafts, to_Project_ProjectUUID)
      if (status === 'X') throw req.reject(400, 'Cannot add new ticket to rejected Project.')
      const { maxID } = await SELECT.one`max(TicketID) as maxID`.from(Ticket.drafts).where({ to_Project_ProjectUUID })
      req.data.TicketID = maxID + 1
      req.data.TicketStatus_code = 'N'
    })

    this.on('getTicketsData', async (req) => {
      const { ProjectUUID } = req.data
      const allTickets = await SELECT `TicketStatus_code as status`.from (Ticket) .where `to_Project_ProjectUUID = ${ProjectUUID}`
      const ticketData = {
        TotalTicketsCount: 0,
        AcceptedTicketsCount: 0,
        CancelledTicketsCount: 0,
        NewTicketsCount: 0
      }
      allTickets.forEach((booking) => {
        ticketData.TotalTicketsCount++
        switch (booking.status) {
          case 'O':
            ticketData.NewTicketsCount++
            break
          case 'A':
            ticketData.AcceptedTicketsCount++
            break          
          case 'X':
            ticketData.CancelledTicketsCount++
            break
          default:
            break
        }
      })
      return ticketData;
    });

    return super.init()
}


}





module.exports = { ProjectService }
