# redcap-support-ticketing-system

- Update alerts to utilize your institutions email.
- Update SQL and jQuery fields in both ticket notes instruments. Replace blank lines with new line characters.

This project is utilized by The Pennsylvania State University and College of Medicine to provide a pseudo-ticket-management-system. Many of the instruments are designed around our needs and can be modified/removed to fit your institution. Below is a guide to customizing this and getting this operational within your REDCap instance. Please keep in mind that this guide assumes the person configuring the project has administrative access to REDCap (necessary for the ticket notes which utilized a SQL field and JavaScript within a calculated field.

1. Create a new project by uploading the REDCap project XML file.
2. Update the alerts to reflect your desired email address. Keep in mind there are many alerts, some of which may not be required in your use case. In some of our cases, alerts are set up to be sent to or from different email addresses depending on type of support requested.
3. Review the feedback ASI, update the email address.
4. Review the instruments. Initial Intake is the basic survey utilized by users to capture their request. Adjust as necessary to fit your needs.
5. TEST, TEST, TEST.

Of course feel free to adapt as you wish. Some changes we will be making include changing from using the next-instance smart variable to new-instance. This will potentially allow you to remove the survey queue setup which we were utilizing in case a user were to click a link to add more notes in an old email. We we also working on automatically creating tickets for certain 'To Do List' items (API token/approve draft changes/MyCap).
