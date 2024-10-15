<cfcomponent>
    <!---  User Registration    --->
    <cffunction  name="registerUser" access="public" returntype="boolean">
        <cfargument name="username" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="role" type="string" required="true">
<!---         <cfset local.hashedPassword=hash(#arguments.password#,"bcrypt")> --->
            <cfquery name="local.checkEmail" datasource="coldfusion">
                SELECT 
                    email
                FROM 
                    users
                WHERE
                    email=<cfqueryparam value="#arguments.email#">
            </cfquery>
            <cfif local.checkEmail.recordCount GT 0>
                <cfoutput>
                    <p>Email Id already Exists</p>
                </cfoutput>
                <cfreturn false>
            <cfelse>
                 <cfquery name="local.regUser" datasource="coldfusion">
                    INSERT INTO 
                        users(username,
                                email,
                                password,
                                role
                            )
                    VALUES(
                        <cfqueryparam value="#arguments.username#"  cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#arguments.role#" cfsqltype="cf_sql_varchar">
                    )                  
                </cfquery>
                <cfset session.isLoggedIn=true>
                <cfset session.username=arguments.username>
                <cfset session.role=arguments.role>
                <cfif session.role EQ "admin" OR session.role EQ "editor">
                    <cflocation url="./Admin/index.cfm">
                <cfelse>
                    <cflocation url="./User/index.cfm">
                </cfif>
                <cfreturn true>
            </cfif>
    </cffunction>

    <!---   User LogIn   --->

    <cffunction  name="userLogIn" access="public" returntype="boolean">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfquery name="local.logUser" datasource="coldfusion">
            SELECT 
                username,
                email,
                password,
                role
            FROM 
                users
            WHERE
                email=<cfqueryparam value="#arguments.email#">
            AND
                password=<cfqueryparam value="#arguments.password#">
        </cfquery>
        <cfif local.logUser.recordCount EQ 1>
            <cfset session.isLoggedIn=true>
            <cfset session.username=local.logUser.username>
             <cfset session.role=local.logUser.role>
            <cfif local.logUser.role EQ "admin" OR local.logUser.role EQ "editor">
                <cflocation url="./Admin/index.cfm">
            <cfelse>
                <cflocation url="./User/index.cfm">
            </cfif>           
            <cfreturn true>
        <cfelse>
            <cfoutput><p>Invalid email id or password</p></cfoutput>
            <cfreturn false>
        </cfif>
    </cffunction>

    <!---  Fetch All Data from the page Table    --->
    <cffunction  name="displayData" access="public" returntype="struct">
        <cfquery name="local.disData" datasource="coldfusion">
            SELECT 
                pageid,
                pagename,
                pagedesc
            FROM 
                pages               
        </cfquery>
        <cfif local.disData GT 0>
            <cfreturn local.disData>
        <cfelse>
            <cfoutput>No data added yet.</cfoutput>
        </cfif>
    </cffunction>
</cfcomponent>