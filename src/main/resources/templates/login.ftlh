<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>



<@c.page>
    <br><font size="21">Login page</font><br>
    <@l.login "/login" /><br>
    <a href="/registration"> Sign up </a>

</@c.page>