<cfcomponent>
    <cffunction  name="saveData" access="public" returntype="boolean">
        <cfargument  name="formData" type="struct" required="true">
        <cftry>
        <!---       Insert Into Database       --->
            <cfquery datasource="coldfusion">
                INSERT INTO JobApplications (position, relocate, join_date, portfolio,resume,salary, first_name, last_name, email, phone)
                VALUES (
                    <cfqueryparam value="#arguments.formData.position#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.formData.relocate#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.formData.joinDate#" cfsqltype="cf_sql_date">,
                    <cfqueryparam value="#arguments.formData.portfolio#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.formData.salary#" cfsqltype="cf_sql_decimal">,
                    <cfqueryparam value="#arguments.formData.firstName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.formData.lastName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.formData.empEmail#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.formData.phone#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
            <cfreturn true>
        <cfcatch type="exception">
            <cfoutput>
                #cfcatch.message#
            </cfoutput>
            <cfreturn false>
        </cfcatch>
        </cftry>
    </cffunction>
</cfcomponent>

<!--- How pdf stored in DB --->