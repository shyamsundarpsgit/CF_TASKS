<cfcomponent>
	<cffunction name="checkEmail" access="remote" returntype="boolean">
		<cfargument name="firstname" required="true" type="string">
        <cfargument name="email" required="true" type="string">
		<cftry>
			<cfquery name="local.userReg" datasource="coldfusion">
                INSERT INTO validateEmail(firstname,email)
                VALUES(
                    <cfqueryparam value="#firstname#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <cfreturn true>
		<cfcatch>
                <cfreturn false>
        </cfcatch>
		</cftry>	
	</cffunction>
</cfcomponent>

