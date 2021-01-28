<#import "parts/common.ftlh" as c>
<#import "parts/gotomain.ftlh" as g>

<@c.page>


  <font size="21" color="#00008b" >List of users</font><br>
  <@g.gototmain/><br><br>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}">edit</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>