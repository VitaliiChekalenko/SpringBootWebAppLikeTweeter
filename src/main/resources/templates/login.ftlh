<#import "parts/common.ftl" as c>
<#import "parts/login.ftlh" as l>


<@c.page>
    <br>Login page<br>
    <@l.login "/login" />
    <a href="/registration"> Sign up </a>

</@c.page>