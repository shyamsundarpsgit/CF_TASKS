<cfset structDelete(session, "loggedIn")>
<cfset structDelete(session, "username")>
<cflocation url="login.cfm" addtoken="false">
