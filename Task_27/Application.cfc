<cfcomponent>
    <cfset this.name="logApp">
    <cfset this.sessionManagement=true>
    <cfset this.sessionTimeOut=createTimespan(0, 0, 30,0)>

    <cffunction  name="checkUserLogIn" returntype="void">
        <!--- User login in restricted pages     --->
        <cfif listFind("welcome.cfm", getFileFromPath(arguments.targetPage))>
            <cfif structKeyExists(session, "loggedIn") OR session.loggedIn EQ false>
                <cflocation  url="login.cfm" addtoken="false">
            </cfif>

        </cfif>
    </cffunction>
</cfcomponent>