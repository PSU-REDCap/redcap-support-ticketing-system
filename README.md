# redcap-support-ticketing-system

This project is utilized by The Pennsylvania State University and College of Medicine to provide a pseudo-ticket-management-system. Many of the instruments are designed around our needs and can be modified/removed to fit your institution. Below is a guide to customizing this and getting this operational within your REDCap instance. Please keep in mind that this guide assumes the person configuring the project has administrative access to REDCap (necessary for the ticket notes which utilized a SQL field and JavaScript within a calculated field.

1. Create a new project by uploading the REDCap project XML file.
2. Update the Ticket Notes Support instrument jquery_s and sql_s fields with the jquery_s.js and sql_s.sql. The SQL should contain "REPLACE(value,'\n','</br>')" on line 30 and 68. The JS should contain "join('\n\n')" on line 6. 
3. Update the Ticket Notes Project Contact instrument jquery_pc and sql_pc fields with the jquery_pc.js and sql_pc.sql. The SQL should contain "REPLACE(value,'\n','</br>')" on line 30 and 68. The JS should contain "join('\n\n')" on line 6.
4. Update the alerts to reflect your desired email address. Keep in mind there are many alerts, some of which may not be required in your use case. In some of our cases, alerts are set up to be sent to or from different email addresses depending on type of support requested.
5. Review the feedback ASI, update the email address.
6. Review the instruments. Initial Intake is the basic survey utilized by users to capture their request. Adjust as necessary to fit your needs.
7. TEST, TEST, TEST.

Of course feel free to adapt as you wish. Some changes we will be making include changing from using the next-instance smart variable to new-instance. This will potentially allow you to remove the survey queue setup which we were utilizing in case a user were to click a link to add more notes in an old email. We we also working on automatically creating tickets for certain 'To Do List' items (API token/approve draft changes/MyCap).

Warning: If a non-admin attempts to edit the JavaScript calculated fields, the code will be wiped out and will need to be re-added by an admin.

Warning: In some cases, like editing the data dictionary and uploading, the SQL field may be inadvertantly changed. You may need to open it up and replace blank lines with a newline character (backslash n).
