<cfif structKeyExists(form, "position" ) AND structKeyExists(form, "relocate" ) AND structKeyExists(form, "joinDate" )
	AND structKeyExists(form, "portfolio" ) AND structKeyExists((form), "resume" ) AND structKeyExists(form, "salary" )
	AND structKeyExists(form, "firstName" ) AND structKeyExists(form, "lastName" ) AND structKeyExists(form,"empEmail") 
    AND structKeyExists(form, "phone" )>

<cfset formData={
        position = form.position,
        relocate = form.relocate,
        joinDate = form.joinDate,
        portfolio = form.portfolio,
		resume=form.resume,
        salary = form.salary,
        firstName = form.firstName,
        lastName = form.lastName,
        empEmail = form.empEmail,
        phone = form.phone
}>

<cfset result = createObject("component","Components.task_23").saveData(formData)>
<cfdump  var="#result#">

<cfelse>
	<cfoutput>
	<p>Formdata missing....</p>
	</cfoutput>
</cfif>