<#import "parts/common.ftlh" as c>
<#import "parts/gotomain.ftlh" as g>

<@c.page>

   <font size="21">User editor</font> <br><br>
    <@g.gototmain/> <br>
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}"><br>
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Save</button>
    </form>
</@c.page>