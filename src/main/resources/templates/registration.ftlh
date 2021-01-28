<#import "parts/common.ftl" as c>
<#import "parts/login.ftlh" as l>


<@c.page>
    Add new user
<br>
    ${message}
<br>
    <@l.login "/registratio n" />
</@c.page>