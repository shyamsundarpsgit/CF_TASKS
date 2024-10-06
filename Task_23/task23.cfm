<cfif structKeyExists(form, "position" ) AND structKeyExists(form, "relocate" ) AND structKeyExists(form, "joinDate" )
	AND structKeyExists(form, "portfolio" ) AND structKeyExists((form), "resume" ) AND structKeyExists(form, "salary" )
	AND structKeyExists(form, "firstName" ) AND structKeyExists(form, "lastName" ) AND structKeyExists(form,"empEmail") 
    AND structKeyExists(form, "phone" )>

<cfset result = "Success">
<cfoutput>
Result : #result#
</cfoutput>

</cfif>