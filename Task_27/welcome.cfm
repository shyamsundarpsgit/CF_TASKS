<cfif structKeyExists(session, "loggedIn")>
<!---   Redirect to login page if not logged in   --->
    <cflocation  url="login.cfm" addtoken="false">
</cfif>
<html>
    <h2>Welcome</h2>
    <p>Welcome <cfoutput>#session.userName#</cfoutput></p>
    <p>You have successfully logged in.</p>
    <a href="logout.cfm">LogOut</a>
</html>