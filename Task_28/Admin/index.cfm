<cfif not structKeyExists(session, "username") OR (session.role NEQ "admin" AND session.role NEQ "editor")>
    <cflocation url="../redirect.cfm">
<cfelse>
    <h1>Welcome <cfoutput>#session.username#</cfoutput></h1>
    <cfset dbObj=createObject("component","Components.task_28")>
    <cfset result=dataObj.displayData()> 
</cfif>

<table border="1">
  <tr>
    <th>Pagename</th>
    <th>PageDesc</th>
    <th>
        Options
    </th>
  </tr>
<!---     <cfloop query="result"> 
      <tr>
         <td>1</td>
         <td>2</td>
         <td>
             <button><a href="add.cfm?id=#resultData.pageid#">Add</a></button>
            <button><a href="">Edit</a></button>
            <button><a href="">Delete</a></button>
       </td>
     </tr>
    </cfloop>--->
</table>